class Cuisine < ActiveRecord::Base
  has_many :restaurants, :dependent  => :destroy  
  validates_uniqueness_of :name
end
