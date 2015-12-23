module PublicIp
  module Service
    class IpEcho < Plain
      def self.uri
        URI('http://ipecho.net/plain')
      end
    end
  end
end
