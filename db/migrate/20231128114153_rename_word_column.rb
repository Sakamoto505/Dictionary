class RenameWordColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :words, :translation, :russian_word
    rename_column :words, :word, :ingush_word
  end
end
