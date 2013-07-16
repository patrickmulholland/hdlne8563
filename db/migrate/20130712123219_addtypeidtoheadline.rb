class Chagngelikename < ActiveRecord::Migration
  def up
    rename_column :likes, :like, :tof
  end

  def down
    rename_column :likes, :tof, :like
  end

end
