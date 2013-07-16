class Deleteusedratingfromheadlines < ActiveRecord::Migration

  
  def change
    remove_column :headlines, :used
    remove_column :headlines, :rating
  end
  



end
