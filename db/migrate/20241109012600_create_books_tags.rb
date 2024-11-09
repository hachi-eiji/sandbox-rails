class CreateBooksTags < ActiveRecord::Migration[8.0]
  def change
    create_table :books_tags do |t|
      t.timestamps
    end
  end
end
