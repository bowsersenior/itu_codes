require 'rake'

desc 'Default: run unit tests.'
task :default => :test

desc 'Run tests'
task :test do
  command = "ruby test/**_test.rb"
  puts command
  system(command) && puts("all tests passed")
end