require 'net/http'
require 'timeout'

module PublicIp
  module Service
    class Simple
      attr_reader :uri
      attr_reader :headers

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
        Timeout.timeout(PublicIp::TIMEOUT_IN_SECS) do
          request = Net::HTTP::Get.new(uri, headers)
          http = Net::HTTP.new(uri.host, uri.port)
          http.use_ssl = (uri.scheme == 'https')
          http.request(request)
        end
      end
    end
  end
end
