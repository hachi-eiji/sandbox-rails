class CreateBooks < ActiveRecord::Migration[8.0]
  def change
    create_table :books, comment: "本" do |t|
      t.string :title, null: false, comment: "タイトル"
      t.references :author, null: false, foreign_key: { on_delete: :cascade }, index: true
      t.integer :price, null: false, comment: "金額(税抜き)"
      t.string :isbn, comment: "ISBNコード"
      t.string :book_jan_code1, comment: "書籍JANコード1"
      t.string :book_jan_code2, comment: "書籍JANコード2"
      t.timestamps
    end
    add_index :books, :isbn, unique: true
    add_index :books, [:book_jan_code1, :book_jan_code2], unique: true
  end
end
