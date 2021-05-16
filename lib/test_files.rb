require 'colorize'
require_relative 'file_reader'
require 'strscan'

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
  end

  private

  def test_camelcase
    @lines.each_with_index do |line, line_num|
      next unless line.match(/class\b/) && !line.match(/\b[A-Z]/)

      message_error = "#{@file_path.uncolorize} : in line:#{line_num + 1}
#{' E: '.yellow}: Use CamelCase after class keyword"
      @errors << message_error
      @errors_number += 1
    end
  end

  def line_length
    @lines.each_with_index do |line, line_num|
      next unless line.length > 120

      message_error = @file_path.to_s.colorize(:light_blue) +
                      ": in line:#{line_num + 1}" + ' E: '.colorize(:yellow) + "Line is too long. [#{line.length}/120]"
      @errors << message_error
      @errors_number += 1
    end
  end
end
