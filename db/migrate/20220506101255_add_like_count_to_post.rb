class AddLikeCountToPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :like_count, :integer
  end
end
