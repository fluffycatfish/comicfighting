class AddCurrentPicToUsers < ActiveRecord::Migration
  def change
    add_column :users, :current_pic, :string
  end
end
