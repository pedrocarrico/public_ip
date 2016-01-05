require 'nokogiri'

module PublicIp
  module Service
    class MxToolbox < ParsedHTML
      def self.uri
        URI('http://mxtoolbox.com/WhatIsMyIP/')
      end

      def self.parse_ip_address(response_body)
        Nokogiri::HTML(response_body).css('#ctl00_ContentPlaceHolder1_hlIP').text
      end
    end
  end
end
