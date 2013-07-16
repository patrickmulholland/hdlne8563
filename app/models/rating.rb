class Rating < ActiveRecord::Base
  attr_accessible :headline_id, :rating
  belongs_to :headline
end
