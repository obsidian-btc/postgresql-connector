require_relative 'spec_init'

module Connection
  class Example
    include DataAccess::PostgreSQL::Connector

    def self.build
      new.tap do |c|
        c.host = '127.0.0.1'
        c.database = 'test_postgresql_connector'
        c.username = 'test_connector'
        c.password = 'test_connector'
      end
    end
  end
end

describe "Connection" do
  specify "Connects to the database" do
    connector = Connection::Example.build
    connector.connect
  end
end
