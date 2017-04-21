require 'nokogiri'

module PublicIp
  module Service
    class MxToolbox < Plain
      def self.uri
        URI('https://api.mxtoolbox.com/api/v1/utils/whatsmyip')
      end
    end
  end
end
