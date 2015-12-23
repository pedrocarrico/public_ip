module PublicIp
  module Service
    class ICanHazIp < Plain
      def self.uri
        URI('http://icanhazip.com')
      end
    end
  end
end
