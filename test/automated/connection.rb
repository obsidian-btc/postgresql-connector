require_relative './automated_init'

context "Connection" do
  test "Connects to the database" do
    connector = Controls::ExampleClass.build
    connection = connector.connect

    assert connection, Controls::ConnectionAssertions do
      connected?
    end
  end
end
