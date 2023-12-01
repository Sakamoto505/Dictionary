# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_11_28_115800) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pg_search_documents", force: :cascade do |t|
    t.text "content"
    t.string "searchable_type"
    t.bigint "searchable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable"
  end

  create_table "words", force: :cascade do |t|
    t.string "ingush_word"
    t.string "russian_word"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.virtual "tsv_word", type: :tsvector, as: "to_tsvector('simple'::regconfig, (COALESCE(ingush_word, ''::character varying))::text)", stored: true
    t.virtual "tsv_translation", type: :tsvector, as: "to_tsvector('simple'::regconfig, (COALESCE(russian_word, ''::character varying))::text)", stored: true
    t.virtual "tsv_ingush_word", type: :tsvector, as: "to_tsvector('simple'::regconfig, (COALESCE(ingush_word, ''::character varying))::text)", stored: true
    t.virtual "tsv_russian_word", type: :tsvector, as: "to_tsvector('simple'::regconfig, (COALESCE(russian_word, ''::character varying))::text)", stored: true
    t.index ["tsv_ingush_word"], name: "index_words_on_tsv_ingush_word", using: :gin
    t.index ["tsv_russian_word"], name: "index_words_on_tsv_russian_word", using: :gin
    t.index ["tsv_translation"], name: "index_words_on_tsv_translation", using: :gin
    t.index ["tsv_word"], name: "index_words_on_tsv_word", using: :gin
  end

end
