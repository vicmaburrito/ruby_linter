class FileReader
  attr_reader :file_path, :lines, :line_number

  def initialize(file_path)
    @file_path = file_path
    @lines = File.readlines(@file_path)
    @line_number = @lines.size
    puts "\nFile read sucessfully\n.\n.\n.\n.".colorize(:green)
  rescue StandardError => e
    @lines = []
    puts "\nThere's a problem with the path you provide #{e}".colorize(:red)
    if File.extname(file_path) != '.rb'
      puts file_path.to_s.colorize(color: :white, background: :red) + "is not a ruby file.
      please select a file with extension .rb"
    end
  end
end
