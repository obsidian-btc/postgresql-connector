ENV['CONSOLE_DEVICE'] ||= 'stdout'
ENV['CONSOLE_COLOR'] ||= 'on'
ENV['LOG_LEVEL'] ||= 'trace'

puts RUBY_DESCRIPTION

require_relative '../init.rb'
Settings.activate

TestLogger = Logger.register 'Test Output'
