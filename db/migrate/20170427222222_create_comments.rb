class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :user_name
      t.string :user_avatar
      t.integer :post_id
      t.string :text

      t.timestamps
    end
  end
end
