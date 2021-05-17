class FileReader
  attr_reader :file_path, :lines, :line_number

  def initialize(file_path)
    @file_path = file_path
    @lines = File.readlines(@file_path)
    @line_number = @lines.size
    puts "File was read sucessfully\n.\n.".colorize(:green)
    puts "#{file_path.to_s.red} is an empty file" if File.empty?(file_path)
  rescue StandardError => e
    @lines = []
    puts "There's a problem with the path you provide #{e}".colorize(:red)
    if File.extname(file_path) != '.rb'
      puts ".\n#{file_path.to_s.red} is not a ruby file please select a file with extension .rb"
    end
  end
end
