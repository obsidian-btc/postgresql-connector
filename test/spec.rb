require_relative 'test_init'

base_dir = File.expand_path(File.dirname(__FILE__))
pattern = File.join base_dir, 'spec/postgresql_connector/*.rb'

files = Dir.glob(pattern).reject { |file| file =~ /_init.rb\z/ }

Runner.! files
