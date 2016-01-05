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
  class TimedOut < StandardError; end

  module_function

  def get_ip(service: :random)
    tries ||= MAX_RETRY_ATTEMPTS
    if service == :random
      PublicIp::Service::Registry.random_service.ip
    else
      PublicIp::Service::Registry[service].ip
    end
  rescue Timeout::Error
    tries -= 1
    if tries > 0 && service == :random
      retry
    else
      raise PublicIp::TimedOut, 'Took too long to get your public ip address, try with another service'
    end
  end

  def list_services
    PublicIp::Service::Registry.available_services
  end
end
