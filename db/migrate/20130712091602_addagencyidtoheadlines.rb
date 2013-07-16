class Addagencyidtoheadlines < ActiveRecord::Migration
  
  
  def change
    add_column :headlines, :agency_id, :integer
  end



end
