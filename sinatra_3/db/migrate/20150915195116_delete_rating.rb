class DeleteRating < ActiveRecord::Migration
  def change
    remove_column :votes, :rating
  end
end
