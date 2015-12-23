$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'public_ip'
require 'webmock/rspec'

WebMock.disable_net_connect!

RSpec.configure do |config|
  config.order = 'random'

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.raise_errors_for_deprecations!
end
