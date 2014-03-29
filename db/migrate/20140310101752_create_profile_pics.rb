class CreateProfilePics < ActiveRecord::Migration
  def change
    create_table :profile_pics do |t|
      t.integer :user_id
      t.string :avatar

      t.timestamps
    end
  end
end
