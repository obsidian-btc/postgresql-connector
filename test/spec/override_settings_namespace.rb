require_relative 'spec_init'
require 'minitest/autorun'

module OverrideSettingsNamespace
  class Example
    include DataAccess::PostgreSQL::Connector

    def self.settings
      OverrideSettingsNamespace::Settings.build
    end

    def self.settings_namespace
      'some_other_namespace'
    end
  end

  class Settings < ::Settings
    def self.data_source
      'test/spec/override_settings_namespace.json'
    end
  end
end

describe "Override default settings namespace" do
  it "Can be changed by overriding the 'settings_namespace' method" do
    connector = OverrideSettingsNamespace::Example.build
    assert(connector.database == 'override_settings_namespace_database')
  end
end
