require_relative 'test_init'

system "test/setup/create_database" or fail "Could not set up database"

TestBench::Runner.(
  'bench/**/*.rb',
  exclude_pattern: %r{/skip\.|(?:_init\.rb|\.sketch\.rb|_sketch\.rb|\.skip\.rb)\z|_integration}
) or extest 1
