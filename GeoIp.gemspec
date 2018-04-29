# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "GeoIp/version"

Gem::Specification.new do |spec|
  spec.name          = "GeoIp"
  spec.version       = GeoIp::VERSION
  spec.authors       = ["alshin"]
  spec.email         = ["yunshang1992@126.com"]

  spec.summary       = %q{获取 IP 地址}
  spec.description   = %q{获取 IP 信息}
  spec.homepage      = "https://github.com/yunshang/GeoIp"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://github.com/yunshang/GeoIp"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_dependency 'json', '~> 2.1.0'
  spec.add_dependency 'rest-client', '~> 2.0.2'
end
