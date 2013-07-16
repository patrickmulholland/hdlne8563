class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :headline_id
      t.integer :user_id
      t.boolean :like

      t.timestamps
    end
  end
end
