class AddVoteTable < ActiveRecord::Migration
  def change
    create_table "votes" do |t|
      t.references :user
      t.references :track
      t.integer :rating
    end
  end
end
