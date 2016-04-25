module PostgreSQL
  module Connector
    def self.included(cls)
      cls.class_exec do
        extend Build
        extend ConfigureConnection
        extend Instance
        extend Settings

        dependency :logger, Telemetry::Logger

        setting :host
        setting :database
        setting :username
        setting :password
      end
    end

    def connection
      @connection ||= connect
    end

    def connect
      logger.opt_trace "Connecting to database \"#{database}\" (Host: #{host})"

      Sequel.connect("postgresql://#{username}:#{password}@#{host}/#{database}?").tap do |connection|
        logger.opt_debug "Connected to database \"#{database}\" (Host: #{host})"

        if respond_to? :specialize
          logger.opt_trace "Specializing the connection to \"#{database}\" (Host: #{host})"
          specialize(connection)
          logger.opt_debug "Specialized the connection to \"#{database}\" (Host: #{host})"
        end
      end
    end

    module Instance
      def instance
        @instance ||= build
      end
    end

    module Build
      def build
        instance = new

        settings = self.settings

        namespace = settings_namespace
        if namespace.nil?
          settings.set instance
        else
          settings.set instance, namespace
        end

        instance
      end

      def settings_namespace
        'postgres_connection'
      end
    end

    module ConfigureConnection
      def configure_connection(receiver, attr_name: nil)
        attr_name ||= :db_connection

        connection = instance.connection
        receiver.public_send "#{attr_name}=", connection
        connection
      end
    end

    module Settings
      def self.extended(cls)
        cls.singleton_class.class_exec do
          extend Virtual::Macro
          abstract :settings
        end
      end
    end
  end
end
