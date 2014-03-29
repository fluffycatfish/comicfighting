class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|
      t.string :name
      t.text :about
      t.integer :round_no
      t.boolean :state

      t.timestamps
    end
  end
end
