module PostgreSQL
  module Connector
    module Controls
      class ExampleClass
        include PostgreSQL::Connector

        def self.build
          new.tap do |c|
            c.host = '127.0.0.1'
            c.database = 'test_postgresql_connector'
            c.username = 'test_connector'
            c.password = 'test_password'
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
  end
end
