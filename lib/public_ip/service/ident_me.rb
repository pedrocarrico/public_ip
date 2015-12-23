module PublicIp
  module Service
    class IdentMe < Plain
      def self.uri
        URI('http://ident.me')
      end
    end
  end
end
