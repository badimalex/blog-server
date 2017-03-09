class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :description
      t.string :author
      t.integer :likes
      t.string :image

      t.timestamps
    end
  end
end
