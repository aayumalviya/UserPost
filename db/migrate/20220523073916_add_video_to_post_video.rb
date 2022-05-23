class AddVideoToPostVideo < ActiveRecord::Migration[6.1]
  def change
    add_column :post_videos, :video, :string
  end
end
