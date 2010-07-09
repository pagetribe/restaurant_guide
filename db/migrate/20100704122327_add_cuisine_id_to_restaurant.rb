class AddCuisineIdToRestaurant < ActiveRecord::Migration
  def self.up
    add_column :restaurants, :cuisine_id, :integer
  end

  def self.down
    remove_column :restaurants, :cuisine_id
  end
end
