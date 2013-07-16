class AddUsedCheckboxToHeadlines < ActiveRecord::Migration
  def change
    add_column :headlines, :used, :boolean
  end
end
