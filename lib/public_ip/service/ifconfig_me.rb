module PublicIp
  module Service
    class IfconfigMe < Plain
      def self.uri
        URI('http://ifconfig.me/ip')
      end

      def self.headers
        { 'User-Agent' => 'curl/7.9.8 (i686-pc-linux-gnu) libcurl 7.9.8 (OpenSSL 0.9.6b) (ipv6 enabled)' }
      end
    end
  end
end
