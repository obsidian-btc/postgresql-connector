require_relative 'bench_init'

module Connection
  class Example
    include PostgreSQL::Connector

    def self.build
      new.tap do |c|
        c.host = '127.0.0.1'
        c.database = 'test_postgresql_connector'
        c.username = 'test_connector'
        c.password = 'test_passwordx'
      end
    end
  end

  module Assertions
    def connected?
      execute 'CREATE TABLE example_table (id uuid NOT NULL);'

      tables == [:example_table]

    ensure
      execute 'DROP TABLE example_table'
    end
  end
end

context "Connection" do
  test "Connects to the database" do
    connector = Connection::Example.build
    connection = connector.connect

    assert connection, Connection::Assertions do
      connected?
    end
  end
end
