require_relative 'postgresql_connector_init'

def run_file(test_file)
  suite_dir = File.expand_path(File.dirname(__FILE__))
  test_filepath = File.join suite_dir, test_file
  load test_filepath
end

['connection.rb', 'specialization.rb'].each do |filename|
  run_file filename
end
