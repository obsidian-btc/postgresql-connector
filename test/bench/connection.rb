require_relative './bench_init'

context "Connection" do
  test "Connects to the database" do
    connector = PostgreSQL::Connector::Controls::ExampleClass.build
    connection = connector.connect

    assert connection, PostgreSQL::Connector::Controls::ConnectionAssertions do
      connected?
    end
  end
end
