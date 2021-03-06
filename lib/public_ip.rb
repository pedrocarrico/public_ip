require 'public_ip/service/registry'
require 'public_ip/service/registrable'
require 'public_ip/service/simple'
require 'public_ip/service/parsed_html'
require 'public_ip/service/plain'
require 'public_ip/service/matched_expression'
require 'public_ip/service/json_type'

require 'public_ip/version'

module PublicIp
  MAX_RETRY_ATTEMPTS = 3
  TIMEOUT_IN_SECS = 3

  class UnknownService < StandardError; end

  module_function

  def get_ip(service: :random)
    tries ||= MAX_RETRY_ATTEMPTS
    if service == :random
      PublicIp::Service::Registry.random_service.ip
    else
      PublicIp::Service::Registry[service].ip
    end
  rescue PublicIp::Service::TimedOut, PublicIp::Service::InvalidIpAddress
    tries -= 1
    retry if tries.positive? && service == :random

    raise
  end

  def list_services
    PublicIp::Service::Registry.available_services
  end
end
