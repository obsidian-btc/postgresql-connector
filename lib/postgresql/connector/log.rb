module PostgreSQL
  module Connector
    class Log < ::Log
      def tag!(tags)
        tags << :verbose
        tags << :postgresql_connector
        tags << :postgres
      end
    end
  end
end
