class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.string :body, null: false
      t.string :email, null: false
      t.integer :price, null: false
      t.string :key, null: false
      t.integer :visits, default: 0
      t.integer :category_id, null: false

      t.timestamps null: false
    end
  end
end
