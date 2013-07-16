class Addstarstolines < ActiveRecord::Migration
  
  def change
    add_column :headlines, :rating, :integer
  end
  
end
