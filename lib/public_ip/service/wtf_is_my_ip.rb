module PublicIp
  module Service
    class WtfIsMyIp < JsonType
      def self.uri
        URI('http://wtfismyip.com/json')
      end

      def self.parse_json(json_data)
        json_data['YourFuckingIPAddress']
      end
    end
  end
end
