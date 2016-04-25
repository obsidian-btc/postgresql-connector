require_relative 'spec_init'

module Specialization
  class Example
    include PostgreSQL::Connector

    def self.build
      new.tap do |c|
        c.host = '127.0.0.1'
        c.database = 'test_postgresql_connector'
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
  specify "Specializes the connection" do
    connector = Specialization::Example.build
    connector.add_specialization
    connector.connect
    assert(connector.specialized?)
  end
end

describe "Connector that doesn't support specialization" do
  specify "Doesn't specialize the connection" do
    connector = Specialization::Example.build
    connector.connect
    refute(connector.specialized?)
  end
end

