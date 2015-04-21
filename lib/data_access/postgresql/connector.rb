require 'sequel'
require 'jdbc/postgres'

require 'dependency'
require 'telemetry/logger'
require 'settings'; Settings.activate

require 'data_access/postgresql/connector/connector'
