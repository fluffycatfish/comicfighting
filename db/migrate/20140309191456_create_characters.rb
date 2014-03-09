class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.integer :user_id
      t.string :name
      t.string :gender
      t.integer :age
      t.string :race

      t.timestamps
    end
  end
end
