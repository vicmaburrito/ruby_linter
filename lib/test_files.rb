require_relative 'file_reader'

class TestingFiles
  attr_reader :file, :lines, :line_size

  def initialize(file_path)
    @file_path = file_path
    @file = ReadFile.new(file_path)
    @lines = @file.lines
  end
end
