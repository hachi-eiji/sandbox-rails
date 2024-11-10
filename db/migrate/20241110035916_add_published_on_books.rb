class AddPublishedOnBooks < ActiveRecord::Migration[8.0]
  def change
    add_column :books, :published_on, :date, null: false, comment: "発売日"
  end
end
