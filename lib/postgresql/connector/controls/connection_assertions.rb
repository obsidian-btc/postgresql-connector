module PostgreSQL
  module Connector
    module Controls
      module ConnectionAssertions
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
