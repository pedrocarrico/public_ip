module PublicIp
  module Service
    class MatchedExpression < Simple
      extend PublicIp::Service::Registrable

      attr_reader :match_regex

      def self.extract_ip(response)
        response.body.match(match_regex)[1].strip
      end
    end
  end
end
