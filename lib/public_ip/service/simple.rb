require 'net/http'
require 'timeout'
require 'ipaddress'

module PublicIp
  module Service
    class InvalidIpAddress < StandardError; end
    class TimedOut < StandardError; end

    class Simple
      attr_reader :uri
      attr_reader :headers

      def self.ip
        response = perform_request

        ip_address = extract_ip(response)

        unless IPAddress.valid?(ip_address)
          raise PublicIp::Service::InvalidIpAddress, "#{ip_address} is not a valid ip address"
        end

        ip_address
      end

      def self.uri
        raise 'Not implemented'
      end

      def self.headers
        {}
      end

      # Perform a demodulize and underscore (as in Rails)
      def self.symbol
        symbol = name.match(/(?:.*)::(.*)$/)[1]
        symbol.gsub!(/::/, '/')
        symbol.gsub!(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
        symbol.gsub!(/([a-z\d])([A-Z])/, '\1_\2')
        symbol.tr!('-', '_')
        symbol.downcase!
        symbol.to_sym
      end

      def self.perform_request
        Timeout.timeout(PublicIp::TIMEOUT_IN_SECS, PublicIp::Service::TimedOut) do
          request = Net::HTTP::Get.new(uri, headers)
          http = Net::HTTP.new(uri.host, uri.port)
          http.use_ssl = (uri.scheme == 'https')
          http.request(request)
        end
      end
    end
  end
end
