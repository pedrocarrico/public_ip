require 'nokogiri'

module PublicIp
  module Service
    class IpChicken < ParsedHTML
      def self.uri
        URI('http://www.ipchicken.com/')
      end

      def self.parse_ip_address(response_body)
        parsed_html = Nokogiri::HTML(response_body).css('table:nth-of-type(2) p:nth-of-type(2) b')
        parsed_html.text.match(/^(?:[0-9]{1,3}\.){3}[0-9]{1,3}/)[0]
      end
    end
  end
end
