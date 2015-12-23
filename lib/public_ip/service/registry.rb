require 'singleton'

module PublicIp
  module Service
    class Registry
      include Singleton

      attr_reader :service_database

      def self.register_service(service_class)
        unless instance.service_database.key?(service_class.symbol)
          instance.service_database[service_class.symbol] = service_class
        end
      end

      def self.[](service)
        instance[service]
      end

      def self.random_service
        instance.random_service
      end

      def self.available_services
        instance.available_services
      end

      def [](service)
        require "public_ip/service/#{service}"
        service_database[service]
      rescue LoadError
        raise PublicIp::UnknownService, "Service #{service} is not a valid service"
      end

      def random_service
        register_all_services

        service_database.values.sample
      end

      def available_services
        register_all_services
        service_database
      end

      private

      def initialize
        @service_database = {}
      end

      def register_all_services
        path = File.join(File.dirname(__FILE__), '*.rb')
        Dir[path].each { |file| require file }
      end
    end
  end
end
