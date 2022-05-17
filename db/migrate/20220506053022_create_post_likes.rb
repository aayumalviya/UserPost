class CreatePostLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :post_likes do |t|
      t.references :user
      t.references :post

      t.timestamps
    end
  end
end
