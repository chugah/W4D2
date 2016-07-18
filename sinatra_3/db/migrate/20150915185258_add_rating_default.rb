class AddRatingDefault < ActiveRecord::Migration
  def change
    change_column :votes, :rating, :integer, :default => 0
  end
end
