class Addagencyidtoprofile < ActiveRecord::Migration
  
  def change
    add_column :profiles, :agency_id, :integer
  end


end
