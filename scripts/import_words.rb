file_path = '/Users/ramazan/Downloads/1russko_ingushskiy_slovar.txt'

File.open(file_path, 'r').each_line do |line|
  parts = line.chomp.split('*').map(&:strip).reject(&:empty?)

  if parts.length >= 2
    ingush_word = parts[0]
    russian_name = parts[1]

    Word.create(ingush_word: ingush_word, russian_name: russian_name)
  end
end
