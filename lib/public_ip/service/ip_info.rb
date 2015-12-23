module PublicIp
  module Service
    class IpInfo < Plain
      def self.uri
        URI('http://ipinfo.io/ip')
      end
    end
  end
end
