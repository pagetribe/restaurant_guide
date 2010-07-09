class AddCardNumToRestaurants < ActiveRecord::Migration
  def self.up
    add_column :restaurants, :card_num, :integer
  end

  def self.down
    remove_column :restaurants, :card_num
  end
end
