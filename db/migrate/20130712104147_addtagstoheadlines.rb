class Addtagstoheadlines < ActiveRecord::Migration

  def change
    add_column :headlines, :tags, :string
  end

end
