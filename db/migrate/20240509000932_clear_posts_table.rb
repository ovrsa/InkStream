class ClearPostsTable < ActiveRecord::Migration[7.1]
  def up
    Post.delete_all
  end

  def down
  end
end

