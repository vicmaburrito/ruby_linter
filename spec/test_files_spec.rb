require_relative '../lib/test_files'

describe TestingFiles do
  path = File.absolute_path('../ruby_linter/Example_files/good_code.rb')
  msg_array = TestingFiles.new(path)
  describe '#results' do
    it 'it would expect a file name and return an array with all the content of the file' do
      expect(msg_array.results).to be_an(Array)
    end
  end
end
