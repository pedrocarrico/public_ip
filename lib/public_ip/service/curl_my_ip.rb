module PublicIp
  module Service
    class CurlMyIp < Plain
      def self.uri
        URI('http://curlmyip.net/')
      end
    end
  end
end
