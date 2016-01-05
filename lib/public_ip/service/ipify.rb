module PublicIp
  module Service
    class Ipify < JsonType
      def self.uri
        URI('http://api.ipify.org/?format=json')
      end

      def self.parse_json(json_data)
        json_data['ip']
      end
    end
  end
end
