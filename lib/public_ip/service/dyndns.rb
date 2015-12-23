module PublicIp
  module Service
    class Dyndns < MatchedExpression
      def self.uri
        URI('http://checkip.dyndns.org')
      end

      def self.match_regex
        /Current IP Address: ((?:[0-9]{1,3}\.){3}[0-9]{1,3})/
      end
    end
  end
end
