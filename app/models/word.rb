class Word < ApplicationRecord
  validates :word, presence: true
  validates :translation, presence: true

  include PgSearch::Model
  multisearchable against: %i[word translation]
end
