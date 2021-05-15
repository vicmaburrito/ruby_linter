require 'colorize'
require_relative 'file_reader'

class TestingFiles
  attr_reader :file, :lines, :line_number, :errors

  def initialize(file_path)
    @file_path = file_path
    @file = FileReader.new(file_path)
    @lines = @file.lines
    @line_number = @file.line_number
    @errors = []
  end

  def results
    test_camelcase
  end

  private

  def test_camelcase
    @lines.each_with_index do |line, line_num|
      if line.match(/class\b/) && !line.match(/\b[A-Z]/)
        message_error = "#{@file_path}: in line:#{line_num + 1} use CamelCase after class keyword".colorize(:red)
        @errors << message_error
      end
    end
  end
end
