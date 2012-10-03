require 'rubygems'
require 'bundler'
Bundler.setup

require 'itu_codes'

TEST_CASE_CLASS = if RUBY_VERSION < '1.9'
  require 'test/unit'
   Test::Unit::TestCase.class_eval do
     alias :refute_equal :assert_not_equal
     alias :refute :assert_false
   end

   Test::Unit::TestCase
else
  require 'minitest/autorun'
  MiniTest::Unit::TestCase
end