class RenameFullTextSearchToWords < ActiveRecord::Migration[7.0]
  disable_ddl_transaction!
  def up
    execute <<-SQL
      ALTER TABLE 
        words 
      ADD 
        COLUMN tsv_ingush_word TSVECTOR GENERATED ALWAYS AS (
          to_tsvector(
            'pg_catalog.simple', 
             COALESCE(ingush_word, '')
          )
        ) STORED;
    SQL

    add_index :words, :tsv_ingush_word, using: 'gin', algorithm: :concurrently
  end

  def down
    remove_index :words, :tsv_ingush_word
    remove_column :words, :tsv_ingush_word
  end
end
