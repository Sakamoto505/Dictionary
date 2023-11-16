file_path = '/Users/ramazan/Downloads/1russko_ingushskiy_slovar.txt'

File.open(file_path, 'r').each_line do |line|
  parts = line.chomp.split('*').map(&:strip).reject(&:empty?)

  if parts.length >= 2
    word = parts[0]
    translation = parts[1]

    Word.create(word: word, translation: translation)
  end
end
