# rubocop:disable Metrics/BlockLength

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'public_ip/version'

Gem::Specification.new do |spec|
  spec.name          = 'public_ip'
  spec.version       = PublicIp::VERSION
  spec.authors       = ['Pedro Carriço']
  spec.email         = ['pedro.carrico@gmail.com']

  spec.summary       = 'Get your public internet IP the easy way.'
  spec.description   = <<-DESCRIPTION
  Ever questioned what is your public internet IP and you've forgotten how to do it.
  Instead of remembering every service that you can query to get your public internet IP you can use PublicIP.
  You can use it directly in your code or in your CLI.
  DESCRIPTION

  spec.homepage      = 'https://github.com/pedrocarrico/public_ip'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'bin'
  spec.executables   = ['public_ip']
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.1'

  spec.add_dependency 'ipaddress', '~> 0.8.3'
  spec.add_dependency 'methadone', '~> 1.9.2'
  spec.add_dependency 'nokogiri', '~> 1.8.1'

  spec.add_development_dependency 'aruba', '~> 0.14.3'
  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'pry', '~> 0.10.3'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.4'
  spec.add_development_dependency 'rubocop', '~> 0.52.1'
  spec.add_development_dependency 'webmock', '~> 1.22.3'
end
# rubocop:enable Metrics/BlockLength
