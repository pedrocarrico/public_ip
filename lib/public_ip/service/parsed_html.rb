module PublicIp
  module Service
    class ParsedHTML < Simple
      extend PublicIp::Service::Registrable

      def self.parse_ip_address(_html)
        raise 'Not implemented'
      end

      def self.extract_ip(response)
        parse_ip_address(response.body)
      end
    end
  end
end
