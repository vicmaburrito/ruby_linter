#!/usr/bin/env ruby
require_relative '../lib/test_files'

msg = TestingFiles.new(ARGV.first)
msg.results
if !msg.errors.empty?
  puts msg.errors
  puts msg.line_number.to_s + ' lines of code inspected, '.colorize(:yellow) + " #{msg.errors_number}" +
       ' offenses'.colorize(:red) + ' detected'
else
  puts ".\nno" + ' offenses'.colorize(:green) + ' detected'
end
