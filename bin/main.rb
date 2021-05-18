#!/usr/bin/env ruby
require_relative '../lib/test_files'

msg = TestingFiles.new(ARGV.first)
msg.results
if !msg.errors.empty?
  puts msg.errors
  puts "#{msg.line_number.to_s} #{'lines of code inspected'}
#{msg.errors_number.to_s} #{'offenses'} #{'detected'}"
else
  puts ".\nno #{'offenses'} detected"
end
