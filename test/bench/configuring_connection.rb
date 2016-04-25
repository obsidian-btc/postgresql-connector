require_relative './bench_init'

context "Configuring a connection" do
  receiver = OpenStruct.new

  test "Default attribute name" do
    PostgreSQL::Connector::Controls::ExampleClass.configure_connection receiver

    assert receiver.db_connection.is_a?(Sequel::Postgres::Database)
  end

  test "Specialized attribute name" do
    PostgreSQL::Connector::Controls::ExampleClass.configure_connection receiver,
      attr_name: :other_attr

    assert receiver.other_attr.is_a?(Sequel::Postgres::Database)
  end
end
