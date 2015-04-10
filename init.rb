require 'bundler'
Bundler.setup

lib_dir = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift lib_dir unless $LOAD_PATH.include?(lib_dir)

require 'data_access/postgresql/connector'
require 'clock'
require 'attribute'
require 'null_attr'
require 'dependency'
require 'logger'
require 'settings'
