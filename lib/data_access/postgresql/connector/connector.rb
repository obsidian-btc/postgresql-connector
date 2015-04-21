module DataAccess
  module PostgreSQL
    module Connector
      def self.included(cls)
        cls.extend ClassMethods

        cls.send :dependency, :logger, ::Telemetry::Logger

        cls.send :setting, :host
        cls.send :setting, :database
        cls.send :setting, :username
        cls.send :setting, :password
      end

      def connection
        @connection ||= connect
      end

      def connect
        logger.trace "Connecting to database \"#{database}\" (Host: #{host})"

        Sequel.connect("jdbc:postgresql://#{host}/#{database}?user=#{username}&password=#{password}").tap do |connection|
          logger.debug "Connected to database \"#{database}\" (Host: #{host})"

          if respond_to? :specialize
            logger.trace "Specializing the connection to \"#{database}\" (Host: #{host})"
            specialize(connection)
            logger.debug "Specialized the connection to \"#{database}\" (Host: #{host})"
          end
        end
      end

      module ClassMethods
        def logger
          ::Telemetry::Logger.get self
        end

        def instance
          @instance ||= build
        end

        def build
          logger.trace "Building database connector"

          instance = new

          settings = implementer.settings()

          namespace = settings_namespace
          if namespace.nil?
            settings.set instance
          else
            settings.set instance, namespace
          end

          logger.debug "Built database connector (Database Name: #{instance.database}, Host #{instance.host})"

          instance
        end

        def settings_namespace
          'postgres_connection'
        end

        def configure_connection(receiver)
          receiver.db_connection = instance.connection
          receiver
        end

        def implementer
          self
        end
      end
    end
  end
end
