class CreateBooksCategories < ActiveRecord::Migration[8.0]
  def change
    create_table :books_categories do |t|
      t.references :book, null: false, foreign_key: { on_delete: :cascade }, index: true
      t.references :category, null: false, foreign_key: { on_delete: :cascade }, index: true
      t.timestamps
    end
  end
end
