require_relative './bench_init'

module DefaultSettingsNamespace
  class Example
    include PostgreSQL::Connector

    def self.settings
      ::Settings.build({
        :postgres_connection => {
          :database => "default_settings_namespace_database"
        }
      })
    end
  end
end

context "Default settings namespace" do
  test "Uses the 'postgres_connection' key for database connection settings" do
    connector = DefaultSettingsNamespace::Example.build
    assert(connector.database == 'default_settings_namespace_database')
  end
end
