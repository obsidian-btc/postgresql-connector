require_relative 'postgresql_connector_init'
require 'runner'

Runner.! 'connection.rb', 'specialization.rb'
