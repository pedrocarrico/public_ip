require 'json'

module PublicIp
  module Service
    class JsonType < Simple
      extend PublicIp::Service::Registrable

      def self.parse_json(_json_data)
        raise 'Not implemented'
      end

      def self.extract_ip(response)
        parse_json(JSON.parse(response.body.strip))
      end
    end
  end
end
