require_relative 'file_reader'

class TestingFiles
  attr_reader :file, :lines, :line_number, :errors, :errors_number

  def initialize(file_path)
    @file_path = file_path
    @file = FileReader.new(file_path)
    @lines = @file.lines
    @line_number = @file.line_number
    @errors = []
    @errors_number = 0
  end

  def results
    test_camelcase
    line_length
    space_methods
  end

  private

  def test_camelcase
    @lines.each_with_index do |line, line_num|
      next unless line.match(/class\b/) && !line.match(/\b[A-Z]/)

      message_error = "#{@file_path}: in line:#{line_num + 1}
E: Use CamelCase after class keyword"
      @errors << message_error
      @errors_number += 1
    end
  end

  def line_length
    @lines.each_with_index do |line, line_num|
      next unless line.length > 120

      message_error = "#{@file_path}: in line:#{line_num + 1}
E: Line is too long. [#{line.length}/120]"
      @errors << message_error
      @errors_number += 1
    end
  end

  def space_methods
    @lines.each_with_index do |line, line_num|
      next unless line.match(/def\b/) && !@lines[line_num - 1].strip.empty?

      message_error = "#{@file_path}: in line:#{line_num + 1}
E: Expected empty line before def keyword"
      @errors << message_error
      @errors_number += 1
    end
  end
end
