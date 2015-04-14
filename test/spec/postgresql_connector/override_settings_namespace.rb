require_relative 'postgresql_connector_init'
require 'minitest/autorun'

module OverrideSettingsNamespace
  class Example
    include DataAccess::PostgreSQL::Connector

    def self.settings
      OverrideSettingsNamespace::Settings.build
    end

    def self.settings_namespace
    end
  end

  class Settings < ::Settings
    def self.pathname
      'test/spec/postgresql_connector/override_settings_namespace.json'
    end
  end
end

describe "Override default settings namespace" do
  it "Can be changed by overriding the 'settings_namespace' method" do
    connector = OverrideSettingsNamespace::Example.build
    assert(connector.database_name == 'override_settings_namespace_database')
  end
end
