class Addtypeidtoheadline < ActiveRecord::Migration
  
  
  def change
    add_column :headlines, :type_id, :integer
  end



end
