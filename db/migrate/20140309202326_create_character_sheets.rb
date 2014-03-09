class CreateCharacterSheets < ActiveRecord::Migration
  def change
    create_table :character_sheets do |t|
      t.integer :character_id
      t.string :title
      t.text :description
      t.string :sheet

      t.timestamps
    end
  end
end
