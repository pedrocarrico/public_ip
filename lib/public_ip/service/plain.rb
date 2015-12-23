module PublicIp
  module Service
    class Plain < Simple
      extend PublicIp::Service::Registrable

      def self.ip
        response = perform_request

        response.body.strip
      end
    end
  end
end
