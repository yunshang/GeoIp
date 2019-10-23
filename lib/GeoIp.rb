require "GeoIp/version"
require 'resolv'
require 'json'
require 'rest-client'

module GeoIp
  class InvalidPrecissionError < ArgumentError; end
  class InvalidIpError < ArgumentError; end

  SERVICE_URL = 'http://ip.taobao.com/service/getIpInfo2.php'
  class << self
    attr_accessor :timeout, :fallback_timeout

    def initialize()
      self.timeout = 1
      self.fallback_timeout = 3
    end

    def set_defaults_if_necessary options
      args = [:country, :province,:city]
      fail InvalidPrecisionError if options[:precision] && !args.include?(options[:precision])
    end

    def lookup_url(ip, options = {})
      set_defaults_if_necessary options
      fail InvalidIpError.new(ip) unless ip.to_s =~ Resolv::IPv4::Regex || ip.to_s =~ Resolv::IPv6::Regex
      "#{SERVICE_URL}?format=json&ip=#{ip}"
    end

    # Retreive the remote location of a given ip address.
    #
    # It takes two optional arguments:
    #
    # ==== Example:
    #   GeoIp.geolocation('209.85.227.104', {:precision => :city})
    def geolocation(ip, options={})
      location = nil
      Timeout.timeout(self.fallback_timeout) do
        parsed_response = JSON.parse RestClient::Request.execute(:method => :get, :url => lookup_url(ip, options), :timeout => self.timeout)
        location = to_j(parsed_response, options)
      end
      location
    end

    private

    def to_j(hash, options={})
      h = {code: hash[:code], ip: hash[:ip], country: hash[:country], area: hash[:area], region: hash[:region], city: hash[:city],\
         isp: hash[:isp], country_id: hash[:country_id]}
      case options[:precision]
      when :country
        h = {country: hash[:country]} # only return country
      when :province
        h = {country: hash[:country], region: hash[:region]} # only country,province
      when :city
        h = {country: hash[:country], region: hash[:region],city: hash[:city]}
      else
        h # return all
      end
      h
    end
  end
end
