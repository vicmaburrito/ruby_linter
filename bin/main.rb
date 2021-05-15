#!/usr/bin/env ruby
require_relative '../lib/test_files'

msg = TestingFiles.new(ARGV.first)
msg.results
if !msg.errors.empty?
  puts msg.errors
  puts "This file contains #{msg.line_size} lines of code".colorize(:yellow)
else
  puts 'no offenses detected'.colorize(:green)
end
