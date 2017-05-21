class AddFilesToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :files, :json
  end
end
