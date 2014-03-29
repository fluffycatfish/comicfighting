class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.text :body
      t.boolean :content
      t.integer :user_id
      t.integer :battle_id

      t.timestamps
    end
  end
end
