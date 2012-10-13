require 'rake'

desc 'Default: run unit tests.'
task :default => :test

desc 'Run tests'
task :test do
  Dir.glob('test/**/*_test.rb').each do |test_file|
    command = "ruby -Itest #{test_file}"
    puts command
    system(command) && puts("all tests passed for #{test_file}")
  end
end