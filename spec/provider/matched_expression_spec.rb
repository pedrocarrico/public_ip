require 'spec_helper'

module PublicIp
  module Service
    class MatchedExpressionService < MatchedExpression
      def self.uri
        URI('http://wwwexample.com')
      end

      def self.headers
        { 'User-Agent' => 'rspec - testing public_ip' }
      end

      def self.match_regex
        /Your IP Address: ((?:[0-9]{1,3}\.){3}[0-9]{1,3})/
      end
    end
  end
end

describe PublicIp::Service::MatchedExpressionService do
  describe '.ip' do
    before do
      stub_request(:get, /.*/)
        .with(headers: { 'User-Agent' => 'rspec - testing public_ip' })
        .to_return(status: 200, body: 'Just testing. Your IP Address: 127.0.0.1 Thanks!', headers: {})
    end

    it 'matches the expression in the response body and returns the ip address' do
      expect(described_class.ip).to eq('127.0.0.1')
    end
  end
end
