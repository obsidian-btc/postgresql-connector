require 'sequel'
require 'pg'

require 'dependency'; Dependency.activate
require 'telemetry/logger'
require 'settings'; Settings.activate
require 'virtual'

require 'postgresql/connector/connector'
