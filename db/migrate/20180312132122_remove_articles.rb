class RemoveArticles < ActiveRecord::Migration[5.1]
  def change
    drop_table :Articles do |t|
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.string :title, null: false
      t.string :content, null: false
      t.string :author, null: false
  end
end
