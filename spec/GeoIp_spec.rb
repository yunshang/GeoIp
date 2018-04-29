require "spec_helper"

RSpec.describe GeoIp do
  before :all do
    IP = "202.102.151.208"
  end
  it "execute success and return ok" do
    res = GeoIp.geolocation(IP)
    res.class == Hash
    res.size == 10
    res[:ret] == 1
  end

  it "precision country"  do
    res = GeoIp.geolocation(IP,:precision=>:country)
    res.size == 1
    res.keys.include?(:country)
  end

  it "precision province"  do
    res = GeoIp.geolocation(IP,:precision => :province)
    res.size == 2
    res.keys.include?(:province)
  end

  it "precision city"  do
    res = GeoIp.geolocation(IP,:precision=>:city)
    res.size == 3
    res.keys.include?(:city)
  end

  it "Invalid IP address"  do
    expect { GeoIp.geolocation("125.3366.363.25") }.to raise_error(InvalidIpError)
  end
end
