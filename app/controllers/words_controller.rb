# frozen_string_literal: true

class WordsController < ApplicationController
  # def index
  #   @pagy, @words = pagy(Word.all, items: 10)
  # end

  def search
    if params[:q].present?
      pagy, words_results = pagy(WordsSearch.call(**search_params))

      respond_to do |format|
        format.html { render 'search', locals: { pagy: pagy, words_results: words_results } }
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace('words_results', partial: 'shared/words_results',
                                                                     locals: { pagy: pagy, words_results: words_results })
        end
      end
    else
      respond_to do |format|
        format.html { render 'search', locals: { pagy: nil, words_results: nil } }
        format.turbo_stream { head :no_content }
      end
    end
  end

  def show
    @word = Word.find(params[:id])
  end



  private

  def search_params
    params.permit(:q, :language).to_unsafe_h
  end
end
