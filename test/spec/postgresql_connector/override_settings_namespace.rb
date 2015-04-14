require_relative 'postgresql_connector_init'
require 'minitest/autorun'

module OverrideSettingsNamespace
  class Example
    include DataAccess::PostgreSQL::Connector

    def self.settings
      OverrideSettingsNamespace::Settings.instance
    end

    def self.settings_namespace
      nil
    end
  end

  class Settings < ::Settings
    def self.instance
      @instance ||= build
    end

    def self.pathname
      'test/spec/postgresql_connector/override_settings_namespace.json'
    end
  end
end

describe "Override default settings samespace" do
  it "Can be changed by overriding the 'settings_namespace' method" do
    connector = OverrideSettingsNamespace::Example.build
    connector.connect
  end
end
