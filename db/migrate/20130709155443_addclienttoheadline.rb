class Addclienttoheadline < ActiveRecord::Migration

  def change
    add_column :headlines, :client, :string
  end


end




