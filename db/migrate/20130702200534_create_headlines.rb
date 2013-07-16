class CreateHeadlines < ActiveRecord::Migration
  def change
    create_table :headlines do |t|
      t.integer :user_id
      t.string :head
      t.string :sub

      t.timestamps
    end
  end
end
