class Changesurenametoname < ActiveRecord::Migration
  def up
    rename_column :profiles, :surname, :firstname
  end

  def down
    rename_column :profiles, :firsname, :surname
  end
end
