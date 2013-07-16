class Agency < ActiveRecord::Base
  attr_accessible :name
  has_many :profiles
end
