require_relative '../lib/test_files'
require 'colorize'

describe TestingFiles do
  path = File.absolute_path('../ruby_linter/Example_files/good_code.rb')
  msg_array = TestingFiles.new(path)
  describe '#results' do
    context 'return an array' do
      it { expect(msg_array.results).not_to be_empty }
    end
  end
end

describe TestingFiles do
  path = File.absolute_path('../ruby_linter/Example_files/empty_file.rb')
  msg_array = TestingFiles.new(path)
  describe '#results' do
    context 'empty file' do
      it { expect(msg_array.results).to be_empty }
    end
  end
end

describe TestingFiles do
  path = File.absolute_path('../ruby_linter/Example_files/bad_code.rb')
  msg_array = TestingFiles.new(path)
  describe '#results' do
    context 'return an array' do
      it { expect(msg_array.results).not_to be_empty }
    end
  end
end
