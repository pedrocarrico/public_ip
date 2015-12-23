module PublicIp
  module Service
    class IfconfigMe < Plain
      def self.uri
        URI('http://ifconfig.me/ip')
      end
    end
  end
end
