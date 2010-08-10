class Restaurant < ActiveRecord::Base
  belongs_to :cuisine
  validates_uniqueness_of :name
  cattr_reader :per_page
  @@per_page = 12
end
