class CreateReadersBooks < ActiveRecord::Migration[8.0]
  def change
    create_table :readers_books do |t|
      t.timestamps
    end
  end
end
