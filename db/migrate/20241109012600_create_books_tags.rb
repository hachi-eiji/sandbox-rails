class CreateBooksTags < ActiveRecord::Migration[8.0]
  def change
    create_table :books_tags do |t|
      t.references :readers_books, null: false, foreign_key: { on_delete: :cascade }, index: true
      t.string :name, null: false, comment: "タグ"
      t.timestamps
    end
  end
end
