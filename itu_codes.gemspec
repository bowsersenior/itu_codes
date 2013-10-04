# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'itu_codes/version'

Gem::Specification.new do |s|
  s.name        = "itu_codes"
  s.version     = ItuCodes::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Mani Tadayon"]
  s.email       = ["bowsersenior@gmail.com"]
  s.homepage    = "http://github.com/bowsersenior/itu_codes"
  s.summary     = "Helpers for dealing with world calling codes."
  s.description = "Helper library for telephone country codes based on the official International Telecommunications Union specifications."
  s.license     = 'MIT'

  s.required_rubygems_version = ">= 1.3.7"

  s.add_development_dependency('rake')

  s.files        = Dir.glob("{bin,lib}/**/*") + %w(MIT-LICENSE README.md)
  s.require_path = 'lib'
end
