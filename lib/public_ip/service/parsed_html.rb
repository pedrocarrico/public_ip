module PublicIp
  module Service
    class ParsedHTML < Simple
      extend PublicIp::Service::Registrable

      def self.ip
        response = perform_request

        parse_ip_address(response.body)
      end
    end
  end
end
