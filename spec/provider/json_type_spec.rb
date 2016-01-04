require 'spec_helper'

module PublicIp
  module Service
    class JSONTypeService < JsonType
      def self.uri
        URI('http://www.example.com/json')
      end

      def self.parse_json(resp)
        resp['ExampleIP']
      end

      def self.headers
        { 'User-Agent' => 'rspec - testing public_ip via json response', 'Content-Type' => 'application/json' }
      end
    end
  end
end

describe PublicIp::Service::JSONTypeService do
  describe '.ip' do
    before do
      stub_request(:get, /.*/)
        .with(headers: described_class.headers)
        .to_return(status: 200, body: "{\"ExampleIP\": \"127.0.0.1\"}\n", headers: {})
    end

    it 'strips the response body, parses json, and returns the ip address' do
      expect(described_class.ip).to eq('127.0.0.1')
    end
  end
end
