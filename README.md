# PublicIp

[![Build Status](https://secure.travis-ci.org/pedrocarrico/public_ip.png)](http://travis-ci.org/pedrocarrico/public_ip) [![Dependency Status](https://gemnasium.com/pedrocarrico/public_ip.png?travis)](https://gemnasium.com/pedrocarrico/public_ip) [![Gem Version](https://badge.fury.io/rb/public_ip.png)](http://badge.fury.io/rb/public_ip) [![Code Climate](https://codeclimate.com/github/pedrocarrico/public_ip/badges/gpa.svg)](https://codeclimate.com/github/pedrocarrico/public_ip)

Ever questioned what is your public internet IP and you've forgotten how to do it.
Instead of remembering every service that you can query to get your public internet IP you can use this gem.
You can use it directly in your code or in your CLI.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'public_ip'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install public_ip

## Usage

### IRB

```ruby
irb(main):001:0> require 'public_ip'
=> true
irb(main):002:0> PublicIp.get_ip
=> "79.169.202.87"
```

### CLI

```bash
$ public_ip
79.169.202.82
```

Running with no arguments on the CLI will try and grab your IP address from a random service.
You can choose which service by passing an argument:

```bash
$ public_ip akamai
79.169.202.84
```

You can also list all available services by like this:

```bash
$ public_ip --list-services
The available services are:
akamai (http://whatismyip.akamai.com)
amazon_aws (http://checkip.amazonaws.com)
dyndns (http://checkip.dyndns.org)
i_can_haz_ip (http://icanhazip.com)
ident_me (http://ident.me)
ifconfig_me (http://ifconfig.me/ip)
ip_echo (http://ipecho.net/plain)
ip_info (http://ipinfo.io/ip)
ip_ogre (http://ipogre.com)
smart_ip (http://smart-ip.net/myip)
what_is_my_ip_address (http://bot.whatismyipaddress.com)
You may pick a service and run public_ip [service] to get your IP address from that service
```

Be sure to run `public_ip --help` to get every available option for the CLI application.

## Development

After checking out the repo, run `bin/setup` to install dependencies.
Then, run `rake spec` or `rake features` to run the tests.
Running `rake rubocop` will ensure consistent ruby syntax throughout the code.
You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.
To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`,
which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/pedrocarrico/public_ip.
This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the
[Contributor Covenant](contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
