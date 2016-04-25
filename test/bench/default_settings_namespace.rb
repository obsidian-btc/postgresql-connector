require_relative './bench_init'

module DefaultSettingsNamespace
  class Example
    include PostgreSQL::Connector

    def self.settings
      DefaultSettingsNamespace::Settings.build
    end
  end

  class Settings < ::Settings
    def self.data_source
      'test/bench/default_settings_namespace.json'
    end
  end
end

context "Default settings namespace" do
  test "Uses the 'postgres_connection' key for database connection settings" do
    connector = DefaultSettingsNamespace::Example.build
    assert(connector.database == 'default_settings_namespace_database')
  end
end
