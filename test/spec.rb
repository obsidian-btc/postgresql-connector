require_relative 'test_init'

system "test/setup/create_database" or fail "Could not set up database"

Dir['test/spec/**/*.rb'].each do |file|
  load file
end
