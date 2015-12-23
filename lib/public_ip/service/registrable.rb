module PublicIp
  module Service
    module Registrable
      def inherited(child_class)
        PublicIp::Service::Registry.register_service(child_class)
      end
    end
  end
end
