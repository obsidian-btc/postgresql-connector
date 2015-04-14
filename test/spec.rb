require_relative 'test_init'

Runner.! 'spec/postgresql_connector/*.rb' do |exclude|
  exclude =~ /_init.rb\z/
end
