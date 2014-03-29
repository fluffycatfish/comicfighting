class CreateBattles < ActiveRecord::Migration
  def change
    create_table :battles do |t|
      t.string :name
      t.text :about
      t.integer :round_id
      t.integer :tournament_id

      t.timestamps
    end
  end
end
