class Removeagencyfromprofiles < ActiveRecord::Migration
  
  def change
    remove_column :profiles, :agency
  end
  

end
