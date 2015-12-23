require 'spec_helper'

module PublicIp
  module Service
    class PlainService < Plain
      def self.uri
        URI('http://wwwexample.com')
      end

      def self.headers
        { 'User-Agent' => 'rspec - testing public_ip' }
      end
    end
  end
end

describe PublicIp::Service::PlainService do
  describe '.ip' do
    before do
      stub_request(:get, /.*/)
        .with(headers: { 'User-Agent' => 'rspec - testing public_ip' })
        .to_return(status: 200, body: "127.0.0.1\n", headers: {})
    end

    it 'strips the response body and returns the ip address' do
      expect(described_class.ip).to eq('127.0.0.1')
    end
  end
end
