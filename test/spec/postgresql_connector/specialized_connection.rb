require_relative 'postgresql_connector_init'
require 'minitest/autorun'

module SpecializedConnection
  class Example
    include DataAccess::PostgreSQL::Connector

    def self.build
      new.tap do |c|
        c.host = '127.0.0.1'
        c.database_name = 'test_postgresql_connector'
        c.username = 'test'
        c.password = 'test'
      end
    end

    def specialize(connection)
      @specialized = true
    end

    def specialized?
      !!@specialized
    end
  end
end

describe "Specialized Connection" do
  it "Specialized the connection" do
    connector = SpecializedConnection::Example.build
    connector.connect
    assert(connector.specialized?)
  end
end
