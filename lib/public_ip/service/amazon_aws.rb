module PublicIp
  module Service
    class AmazonAWS < Plain
      def self.uri
        URI('http://checkip.amazonaws.com')
      end
    end
  end
end
