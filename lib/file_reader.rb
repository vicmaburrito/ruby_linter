class FileReader
  attr_reader :file_path, :lines, :line_number

  def initialize(file_path)
    @file_path = file_path
    @lines = File.readlines(@file_path)
    @line_number = @lines.size
    puts "File read sucessfully\n.\n.\n.\n.\n.".colorize(:green)
  rescue StandardError => e
    @lines = []
    puts "There's a problem with the path you provide #{e}".colorize(:red)
  end
    end
