class AddCreatedBy < ActiveRecord::Migration
  def change
    add_column :tracks, :created_by, :string
  end
end
