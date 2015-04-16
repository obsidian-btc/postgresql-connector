require_relative 'spec_init'
require 'minitest/autorun'

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
  it "Uses the 'postgres_connection' key for database connection settings" do
    connector = DefaultSettingsNamespace::Example.build
    assert(connector.database_name == 'default_settings_namespace_database')
  end
end
