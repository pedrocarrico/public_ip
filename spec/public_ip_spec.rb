require 'spec_helper'

module PublicIp
  module Service
    class TestService < Simple
      def self.ip
        '127.0.0.1'
      end
    end
  end
end

describe PublicIp do
  describe '.get_ip' do
    context 'when called with no arguments' do
      it 'gets the ip address from a random service' do
        expect(PublicIp::Service::Registry.instance).to receive(:random_service)
          .and_return(PublicIp::Service::TestService)
        expect(PublicIp.get_ip).to eq('127.0.0.1')
      end
    end
  end
end
