# frozen_string_literal: true

class ApplicationSearch
  extend Dry::Initializer[undefined: false]

  FORBIDDEN_SEARCH_SYMBOLS = %w[! ( ) | < & @ ' :].freeze

  def self.call(...)
    new(...).call
  end

  def call
    raise NotImplementedError
  end

  protected

  def prepare_tsv_query(string)
    string.tr(FORBIDDEN_SEARCH_SYMBOLS.join, ' ')
          .split(/\s+/)
          .compact_blank
          .uniq
          .map { |word| "#{word}:*" }.join(' & ')
  end
end
