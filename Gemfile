source 'https://rubygems.org'

gem 'sequel'

source 'https://gem.fury.io/eventide' do
  gem 'virtual'

  gem 'attribute'
  gem 'clock'
  gem 'configure'
  gem 'log'
  gem 'initializer'
  gem 'schema'
  gem 'serialize'
  gem 'settings'
  gem 'telemetry'
  gem 'validate'
end

group :development do
  gem 'test_bench'
  gem 'pry'
  gem 'pry-doc'
end

if RUBY_ENGINE == 'jruby'
  gem 'pg', '0.17.1', :platform => :jruby, :git => 'git://github.com/headius/jruby-pg.git', :branch => :master
else
  gem 'pg'
end
