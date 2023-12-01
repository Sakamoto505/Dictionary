class WordsSearch < ApplicationSearch
  option :q, optional: true
  option :language, optional: true

  def call
    results
  end

  def words
    if q.present?
      if language == "ingush"
        Word.where("tsv_ingush_word @@ to_tsquery('simple', :tsquery)", tsquery: prepare_tsv_query(q))
      elsif language == "russian"
        Word.where("tsv_russian_word @@ to_tsquery('simple', :tsquery)", tsquery: prepare_tsv_query(q))
        else
      Word.none
      end
    end
  end

  def prepare_tsv_query(string)
    string.tr(FORBIDDEN_SEARCH_SYMBOLS.join, ' ')
          .split(/\s+/)
          .compact_blank
          .uniq
          .map { |word| "#{word}:*" }.join(' & ')
  end

  def results
    words.order(created_at: :desc)
  end
end
