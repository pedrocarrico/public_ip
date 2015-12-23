module PublicIp
  module Service
    class WhatIsMyIpAddress < Plain
      def self.uri
        URI('http://bot.whatismyipaddress.com')
      end
    end
  end
end
