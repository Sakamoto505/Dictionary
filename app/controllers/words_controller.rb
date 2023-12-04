
class WordsController < ApplicationController

  # def index
  #   @pagy, @words = pagy(Word.all, items: 10)
  # end

  def search
    pagy, words_results = pagy(WordsSearch.call(**search_params))

    render 'search', locals: { pagy: pagy, words_results: words_results }
  end

  def show
    @word = Word.find(params[:id])
  end

  private

  def  search_params
    params.permit(:q, :language).to_unsafe_h
  end
end
