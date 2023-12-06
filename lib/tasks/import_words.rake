# frozen_string_literal: true

namespace :import do
  desc 'Import words from a text file'
  task words: :environment do
    file_path = '/Users/ramazan/Downloads/1russko_ingushskiy_slovar.txt'
    File.open(file_path, 'r').each_line do |line|
      parts = line.chomp.split('*').map(&:strip).reject(&:empty?)

      next unless parts.length >= 2

      ingush_word = parts[1]
      russian_word = parts[0]

      Word.create(ingush_word: ingush_word, russian_word: russian_word)
    end

    puts 'Words imported successfully!'
  end
end
