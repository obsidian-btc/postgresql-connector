require_relative 'spec_init'

module DefaultSettingsNamespace
  class Example
    include DataAccess::PostgreSQL::Connector

    def self.settings
      DefaultSettingsNamespace::Settings.build
    end
  end

  class Settings < ::Settings
    def self.data_source
      'test/spec/default_settings_namespace.json'
    end
  end
end

describe "Default settings namespace" do
  specify "Uses the 'postgres_connection' key for database connection settings" do
    connector = DefaultSettingsNamespace::Example.build
    assert(connector.database == 'default_settings_namespace_database')
  end
end
