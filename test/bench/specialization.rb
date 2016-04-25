require_relative './bench_init'

module Specialization
  class Example < PostgreSQL::Connector::Controls::ExampleClass
    include PostgreSQL::Connector

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

context "Connector that supports specialization" do
  test "Specializes the connection" do
    connector = Specialization::Example.build
    connector.add_specialization
    connector.connect
    assert(connector.specialized?)
  end
end

context "Connector that doesn't support specialization" do
  test "Doesn't specialize the connection" do
    connector = Specialization::Example.build
    connector.connect
    refute(connector.specialized?)
  end
end
