module PublicIp
  module Service
    class SmartIp < Plain
      def self.uri
        URI('http://smart-ip.net/myip')
      end
    end
  end
end
