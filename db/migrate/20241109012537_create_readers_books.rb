class CreateReadersBooks < ActiveRecord::Migration[8.0]
  def change
    create_table :readers_books, comment: "所持本" do |t|
      t.references :reader, null: false, foreign_key: { on_delete: :cascade }, index: true
      t.references :book, foreign_key: true, index: true
      t.string :book_title, null: false, comment: "所持している本のタイトル"
      t.datetime :bought_at, null: false, comment: "購入日"
      t.integer :price, null: false, comment: "金額"
      t.timestamps
    end
  end
end
