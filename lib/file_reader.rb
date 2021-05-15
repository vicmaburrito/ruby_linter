class ReadFile
  attr_reader :file_path, :lines, :line_size

  def initialize(file_path)
    @file_path = file_path
    @lines = File.readlines(@file_path)
    puts 'File_read'
  end
end
