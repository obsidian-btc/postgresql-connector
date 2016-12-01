require_relative './automated_init'

context "Configuring a connection" do
  receiver = OpenStruct.new

  test "Default attribute name" do
    Controls::ExampleClass.configure_connection receiver

    assert receiver.db_connection.is_a?(Sequel::Postgres::Database)
  end

  test "Specialized attribute name" do
    Controls::ExampleClass.configure_connection receiver,
      attr_name: :other_attr

    assert receiver.other_attr.is_a?(Sequel::Postgres::Database)
  end
end
