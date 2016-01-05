require 'nokogiri'

module PublicIp
  module Service
    class WhatIsMyIp < ParsedHTML
      def self.uri
        URI('https://www.whatismyip.com/')
      end

      def self.headers
        { 'User-Agent' => 'Chrome' }
      end

      def self.parse_ip_address(response_body)
        Nokogiri::HTML(response_body).css('.ip div').text
      end
    end
  end
end
