class Createtableagencies < ActiveRecord::Migration
 
  def change
    create_table :agencies do |t|
      t.string :name
      t.timestamps
    end
  end

end
