class RemoveCommentFromGame < ActiveRecord::Migration
  def change
    remove_column :games, :comment
  end
end
