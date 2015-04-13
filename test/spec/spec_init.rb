require_relative '../test_init'

lib_dir = File.expand_path('../postgresql_connector', __FILE__)
$LOAD_PATH.unshift lib_dir unless $LOAD_PATH.include?(lib_dir)
