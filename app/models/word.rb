class Word < ApplicationRecord

  validates :ingush_word, presence: true
  validates :russian_word, presence: true

end
