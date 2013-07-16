class Profile < ActiveRecord::Base
  attr_accessible :agency, :lastname, :firstname, :user_id, :username, :agency_name
  belongs_to :user
  belongs_to :agency
  
  validates :username, presence: true
  validates :agency_name, presence: true
  validates_uniqueness_of :username
  
  
  

  def agency_name
    agency.try(:name)
  end
  
  def agency_name=(name)
    self.agency = Agency.find_or_create_by_name(name) if name.present?
  end
  
  
  
end
