require 'nokogiri'

module PublicIp
  module Service
    class PrivateInternetAccess < ParsedHTML
      def self.uri
        URI('https://www.privateinternetaccess.com/pages/whats-my-ip/')
      end

      def self.parse_ip_address(response_body)
        Nokogiri::HTML(response_body).css('.ipbox-footer ul li:first-of-type span').text.strip
      end
    end
  end
end
