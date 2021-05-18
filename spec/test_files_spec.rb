require_relative '../lib/test_files'

describe TestingFiles do
  path = File.absolute_path('../ruby_linter/Example_files/good_code.rb')
  msg_array = TestingFiles.new(path)
  describe '#results' do
    context 'return an array' do
      it { expect(msg_array.results).not_to be_empty }
    end
  end
end
