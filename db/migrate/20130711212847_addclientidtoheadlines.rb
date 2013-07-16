class Addclientidtoheadlines < ActiveRecord::Migration


  def change
    add_column :headlines, :client_id, :integer
  end



end
