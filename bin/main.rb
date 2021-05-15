require_relative '../lib/test_files'

msg = TestingFiles.new(ARGV.first)
puts msg.lines
