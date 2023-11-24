class Word < ApplicationRecord

  validates :word, presence: true
  validates :translation, presence: true

end
