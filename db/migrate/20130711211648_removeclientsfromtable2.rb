class Removeclientsfromtable2 < ActiveRecord::Migration
  
  def change
    remove_column :headlines, :client
  end
  

end
