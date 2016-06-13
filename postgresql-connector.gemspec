# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name = 'postgresql-connector'
  s.summary = 'PostgreSQL Connector for Sequel'
  s.version = '0.1.0.1'
  s.authors = ['']
  s.require_paths = ['lib']
  s.files = Dir.glob('{lib}/**/*')
  s.required_ruby_version = '>= 1.9.2'

  s.add_runtime_dependency 'sequel', '> 0'

  if RUBY_ENGINE == 'jruby'
    s.add_runtime_dependency 'jruby-pg', '> 0'
    s.platform = 'java'
  else
    s.add_runtime_dependency 'pg', '> 0'
    s.platform = Gem::Platform::RUBY
  end

  s.add_runtime_dependency 'settings', '> 0'
  s.add_runtime_dependency 'virtual', '> 0'

  s.add_development_dependency 'test_bench'
end
