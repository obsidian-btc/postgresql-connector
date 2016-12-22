source 'https://rubygems.org'

gem 'sequel'

gem 'evt-virtual'
gem 'evt-settings'

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
