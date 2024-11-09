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

ActiveRecord::Schema[8.0].define(version: 2024_11_09_012708) do
  create_table "authors", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", comment: "著者", force: :cascade do |t|
    t.string "name", null: false, comment: "氏名"
    t.integer "gender", null: false, comment: "性別"
    t.date "birthday", comment: "誕生日"
    t.date "debut_on", null: false, comment: "デビュー日"
    t.text "like_book_memo", null: false, comment: "好きな本"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["debut_on"], name: "index_authors_on_debut_on"
  end

  create_table "books", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", comment: "本", force: :cascade do |t|
    t.string "title", null: false, comment: "タイトル"
    t.integer "price", null: false, comment: "金額(税抜き)"
    t.string "isbn", comment: "ISBNコード"
    t.string "book_jan_code1", comment: "書籍JANコード1"
    t.string "book_jan_code2", comment: "書籍JANコード2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_jan_code1", "book_jan_code2"], name: "index_books_on_book_jan_code1_and_book_jan_code2", unique: true
    t.index ["isbn"], name: "index_books_on_isbn", unique: true
  end

  create_table "books_categories", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "book_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_books_categories_on_book_id"
    t.index ["category_id"], name: "index_books_categories_on_category_id"
  end

  create_table "books_tags", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "readers_books_id", null: false
    t.string "name", null: false, comment: "タグ"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["readers_books_id"], name: "index_books_tags_on_readers_books_id"
  end

  create_table "categories", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", comment: "本のカテゴリー", force: :cascade do |t|
    t.string "name", null: false, comment: "カテゴリー名"
    t.date "start_on", null: false, comment: "利用開始日"
    t.date "end_on", comment: "利用終了日"
    t.virtual "search_end_on", type: :date, null: false, comment: "検索などで使う終了日", as: "coalesce(`end_on`,_utf8mb4'2099-12-31')", stored: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "readers", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", comment: "読者", force: :cascade do |t|
    t.string "name", null: false, comment: "氏名"
    t.integer "gender", null: false, comment: "性別"
    t.date "birthday", comment: "誕生日"
    t.text "like_book_memo", null: false, comment: "好きな本"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "readers_books", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", comment: "所持本", force: :cascade do |t|
    t.bigint "reader_id", null: false
    t.bigint "book_id"
    t.string "book_title", null: false, comment: "所持している本のタイトル"
    t.datetime "bought_at", null: false, comment: "購入日"
    t.integer "price", null: false, comment: "金額"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_readers_books_on_book_id"
    t.index ["reader_id"], name: "index_readers_books_on_reader_id"
  end

  add_foreign_key "books_categories", "books", on_delete: :cascade
  add_foreign_key "books_categories", "categories", on_delete: :cascade
  add_foreign_key "books_tags", "readers_books", column: "readers_books_id", on_delete: :cascade
  add_foreign_key "readers_books", "books"
  add_foreign_key "readers_books", "readers", on_delete: :cascade
end
