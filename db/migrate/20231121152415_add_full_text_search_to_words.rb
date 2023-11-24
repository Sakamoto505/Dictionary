class AddFullTextSearchToWords < ActiveRecord::Migration[7.0]
  def up
    add_column :words, :search_vector, 'tsvector'
    add_index :words, :search_vector, using: 'gin'
  end

  def down
    remove_column :words, :search_vector
  end
end