class Addcategoryidtoheadlines < ActiveRecord::Migration


  def change
    add_column :headlines, :category_id, :integer
  end


end
