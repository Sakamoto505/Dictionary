class WordsController < ApplicationController


  def index
    @words = Word.all
  end
  def create

  end

  def show
    @word = Word.find(params[:id])
  end
end
