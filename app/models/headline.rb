class Headline < ActiveRecord::Base
  attr_accessible :head, :sub, :user_id, :category_id, :type_id, :used, :rating, :client_id, :client_name, :tags
  belongs_to :user
  belongs_to :category
  belongs_to :client
  belongs_to :type
  has_many :ratings
  
  validates :head, presence: true
  
  has_many :likes
  # has_many :users, through: :likes


  def client_name
    client.try(:name)
  end
  
  def client_name=(name)
    self.client = Client.find_or_create_by_name(name) if name.present?
  end
  
    
end
