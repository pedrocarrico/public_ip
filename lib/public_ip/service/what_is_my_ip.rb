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
        doc = Nokogiri::HTML(response_body).at('h3:contains("Your Public IPv4 is: ")')

        return doc.text.strip.sub('Your Public IPv4 is: ', '') unless doc.nil?
      end
    end
  end
end
