class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :username
      t.string :surname
      t.string :lastname
      t.string :agency

      t.timestamps
    end
  end
end
