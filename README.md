# GeoIp

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/GeoIp`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'GeoIp', :git => 'git://github.com/yunshang/GeoIp.git'
```

And then execute:

    $ bundle

## Usage

### Retrieve geolocation
    GeoIp.geolocation(ip_address)

### Example

    # 12.130.132.30 = sina.com.cn (CN)
    GeoIp.geolocation('12.130.132.30')
returns:  
  { :ret => 1, :start => "202.108.24.0", :end => "202.108.58.255", :country => "中国", :province => "北京", :city => "北京", :district => "", :isp => "联通", :type => "", :desc => "" }
 ### precision

There is an option to only retreive the country information and thus excluding the city details. This results in a faster response from the service since less queries need to be done.

#### precision country

    GeoIp.geolocation('202.108.24.0', :precision => :country)

returns:

  { :country => "中国" }

#### precision province

    GeoIp.geolocation('202.108.24.0', :precision => :province)

returns:

  { :country => "中国", :province => "北京" }

#### precision city

    GeoIp.geolocation('202.108.24.0', :precision => :city)

returns:

  { :country => "中国", :province => "北京", :city => "北京" }


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/yunshang/GeoIp. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the GeoIp project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/yunshang/GeoIp/blob/master/CODE_OF_CONDUCT.md).
