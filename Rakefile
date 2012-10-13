require 'rake'

desc 'Default: run unit tests.'
task :default => :test

desc 'Run tests'
task :test do
  test_files = Dir.glob('test/**/*_test.rb').join(' ')
  command = "ruby #{test_files}"
  puts command
  system(command) && puts("all tests passed")
end