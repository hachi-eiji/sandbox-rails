class CreateCategories < ActiveRecord::Migration[8.0]
  def change
    create_table :categories, comment: "本のカテゴリー" do |t|
      t.string :name, null: false, comment: "カテゴリー名"
      t.date :start_on, null: false, comment: "利用開始日"
      t.date :end_on, comment: "利用終了日"
      t.virtual :search_end_on, null: false, type: :date, as: "COALESCE(end_on, '2099-12-31')", stored: true, comment: "検索などで使う終了日"
      t.timestamps
    end
  end
end
