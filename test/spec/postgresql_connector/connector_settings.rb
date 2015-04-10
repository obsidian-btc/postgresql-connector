require_relative '../spec_helper'
require 'minitest/autorun'


module DataAccess
  module PostgreSQL
    class ExampleConnector
      include DataAccess::PostgreSQL::Connector

    end
  end
end

describe "postgres connector" do
  before do
    @db_connection = DataAccess::PostgreSQL::ExampleConnector.new
    @db_connection.username = 'some_username'
  end

  describe "settings" do
    it 'creates an instance of the PostgreSQL Connector with settings'
      @db_connection.username.must_equal 'some_username'
  end
end
