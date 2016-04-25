# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name = 'postgresql_connector'
  s.summary = 'PostgreSQL Connector for Sequel'
  s.version = '0.0.0'
  s.authors = ['']
  s.require_paths = ['lib']
  s.files = Dir.glob('{lib}/**/*')
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 1.9.2'

  s.add_runtime_dependency 'sequel', '> 0'
  s.add_runtime_dependency 'pg', '> 0'

  s.add_runtime_dependency 'settings', '> 0'

  s.add_development_dependency 'minitest', '~> 5.5.0'
  s.add_development_dependency 'minitest-spec-context', '~> 0.0.3'
end
