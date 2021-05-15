#!/usr/bin/env ruby
require_relative '../lib/test_files'

msg = TestingFiles.new(ARGV.first)
msg.results
if !msg.errors.empty?
  puts msg.errors
  puts "this file contains #{msg.line_number} lines of code".colorize(:yellow)
else
  puts ".\n.\nno offenses detected".colorize(:green)
end
