class Like < ActiveRecord::Base
  attr_accessible :headline_id, :like, :user_id
  
  belongs_to :headline
  belongs_to :user
  
end
