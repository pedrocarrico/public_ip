module PublicIp
  module Service
    class IpAPI < JsonType
      def self.uri
        URI('http://ip-api.com/json')
      end

      def self.parse_json(json_data)
        json_data['query']
      end
    end
  end
end
