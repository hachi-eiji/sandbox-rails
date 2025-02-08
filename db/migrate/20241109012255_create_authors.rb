class CreateAuthors < ActiveRecord::Migration[8.0]
  def change
    create_table :authors, comment: "著者" do |t|
      t.string :name, null: false, comment: "氏名"
      t.integer :gender, null: false, comment: "性別"
      t.date :birthday, comment: "誕生日"
      t.date :debut_on, null: false, comment: "デビュー日", index: true
      t.text :like_book_memo, null: false, comment: "好きな本"
      t.timestamps
    end
  end
end
