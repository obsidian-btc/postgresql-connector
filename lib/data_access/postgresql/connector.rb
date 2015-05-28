require 'sequel'
require 'jdbc/postgres'

require 'dependency'; Dependency.activate
require 'telemetry/logger'
require 'settings'; Settings.activate

require 'data_access/postgresql/connector/connector'
