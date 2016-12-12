require_relative './automated_init'

context "Connection" do
  connector = Controls::ExampleClass.build
  connection = connector.connect

  test "Connects to the database" do
    assert connection, Controls::ConnectionAssertions do
      connected?
    end
  end

  test "Timezone is set to UTC" do
    assert connection.timezone == :utc
  end
end
