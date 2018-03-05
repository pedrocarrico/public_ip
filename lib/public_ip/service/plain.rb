module PublicIp
  module Service
    class Plain < Simple
      extend PublicIp::Service::Registrable

      def self.extract_ip(response)
        response.body.strip.delete('"')
      end
    end
  end
end
