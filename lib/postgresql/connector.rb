require 'sequel'
require 'pg'

require 'dependency'; Dependency.activate
require 'log'
require 'settings'; Settings.activate
require 'virtual'

require 'postgresql/connector/log'
require 'postgresql/connector/connector'
