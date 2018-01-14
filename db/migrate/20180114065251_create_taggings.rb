class CreateTaggings < ActiveRecord::Migration[5.1]
  def change
    create_table :taggings do |t|
      t.integer :list_item_id
      t.integer :tag_id
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
