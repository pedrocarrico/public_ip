module PublicIp
  module Service
    class Akamai < Plain
      def self.uri
        URI('http://whatismyip.akamai.com')
      end
    end
  end
end
