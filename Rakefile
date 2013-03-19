require 'rake'

desc 'Default: run unit tests.'
task :default => :test

desc 'Run tests'
task :test do
  if RUBY_VERSION < "1.9"
    raise "Tests for ItuCodes require ruby 1.9 or greater."
  end
  
  Dir.glob('test/**/*_test.rb').each do |test_file|
    command = "ruby -Itest #{test_file}"
    system(command)
    color = $?.success? ? "\e[32m" : "\e[31m"
    puts("#{color}#{test_file}\e[0m")
  end
end