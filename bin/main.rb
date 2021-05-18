#!/usr/bin/env ruby
require 'colorize'
require_relative '../lib/test_files'

msg = TestingFiles.new(ARGV.first)
msg.results
if !msg.errors.empty?
  puts msg.errors
  puts "#{msg.line_number.to_s.uncolorize} #{'lines of code inspected'.yellow}
#{msg.errors_number.to_s.red} #{'offenses'.red} #{'detected'.uncolorize}"
else
  puts ".\nno #{'offenses'.green} detected"
end
