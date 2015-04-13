require_relative 'postgresql_connector_init'
require 'minitest/autorun'

module Specialization
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

    def specialized?
      !!@specialized
    end

    def add_specialization
      extend Specialize
    end

    module Specialize
      def specialize(connection)
        @specialized = true
      end
    end
  end
end

describe "Connector that supports specialization" do
  it "Specializes the connection" do
    connector = Specialization::Example.build
    connector.add_specialization
    connector.connect
    assert(connector.specialized?)
  end
end

describe "Connector that doesn't support specialization" do
  it "Doesn't specialize the connection" do
    connector = Specialization::Example.build
    connector.connect
    refute(connector.specialized?)
  end
end

