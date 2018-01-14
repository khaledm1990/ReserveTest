class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :name
      t.integer :price
      t.string :currency
      t.text :description
      t.integer :owner_id

      t.timestamps
    end
  end
end
