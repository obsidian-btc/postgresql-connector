module DataAccess
  module PostgreSQL
    module Connector
      def self.included(cls)
        cls.extend ClassMethods

        cls.send :dependency, :logger

        cls.send :setting, :host
        cls.send :setting, :database_name
        cls.send :setting, :username
        cls.send :setting, :password
      end

      def connection
        @connection ||= connect
      end

      def connect
        logger.trace "Connecting to database \"#{database_name}\" (Host: #{host})"

        Sequel.connect("jdbc:postgresql://#{host}/#{database_name}?user=#{username}&password=#{password}").tap do |connection|
          logger.debug "Connected to database \"#{database_name}\" (Host: #{host})"

          if respond_to? :specialize
            logger.trace "Specializing the connection to \"#{database_name}\" (Host: #{host})"
            specialize(connection)
            logger.debug "Specialized the connection to \"#{database_name}\" (Host: #{host})"
          end
        end
      end

      module ClassMethods
        def logger
          Logger.get self
        end

        def instance
          @instance ||= build
        end

        def build
          logger.trace "Building database connector"

          instance = new

          settings = implementer.settings()
          settings.set instance, 'postgres_connection'

          logger.debug "Built database connector (Database Name: #{database_name}, Host #{host})"

          instance
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
