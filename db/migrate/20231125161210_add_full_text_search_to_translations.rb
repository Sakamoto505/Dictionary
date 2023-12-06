# frozen_string_literal: true

class AddFullTextSearchToTranslations < ActiveRecord::Migration[7.0]
  disable_ddl_transaction!

  def up
    execute <<-SQL
      ALTER TABLE#{' '}
        words#{' '}
      ADD#{' '}
        COLUMN tsv_translation TSVECTOR GENERATED ALWAYS AS (
          to_tsvector(
            'pg_catalog.simple',#{' '}
             COALESCE(translation, '')
          )
        ) STORED;
    SQL

    add_index :words, :tsv_translation, using: 'gin', algorithm: :concurrently
  end

  def down
    remove_index :words, :tsv_translation
    remove_column :words, :tsv_translation
  end
end
