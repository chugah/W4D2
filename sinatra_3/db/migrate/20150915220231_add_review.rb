class AddReview < ActiveRecord::Migration
  def change
    create_table "reviews" do |t|
      t.references :user
      t.references :song
      t.text :review_text
    end
  end
end
