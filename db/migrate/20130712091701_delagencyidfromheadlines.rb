class Delagencyidfromheadlines < ActiveRecord::Migration
  def change
    remove_column :headlines, :agency_id
  end
  


end
