class Restaurant < ActiveRecord::Base
  belongs_to :cuisine
  validates_uniqueness_of :name
end
