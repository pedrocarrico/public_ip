require 'spec_helper'

require 'nokogiri'

module PublicIp
  module Service
    class ParsedHTMLService < ParsedHTML
      def self.uri
        URI('http://www.example.com')
      end

      def self.headers
        { 'User-Agent' => 'rspec - testing public_ip' }
      end

      def self.parse_ip_address(response_body)
        Nokogiri::HTML(response_body).css('.ip').text
      end
    end
  end
end

describe PublicIp::Service::ParsedHTMLService do
  describe '.ip' do
    before do
      stub_request(:get, /.*/)
        .with(headers: { 'User-Agent' => 'rspec - testing public_ip' })
        .to_return(status: 200, body: '<html><body><div class="ip">127.0.0.1</div></body></html>', headers: {})
    end

    it 'parses the html in the response body and returns the ip address' do
      expect(described_class.ip).to eq('127.0.0.1')
    end
  end
end
