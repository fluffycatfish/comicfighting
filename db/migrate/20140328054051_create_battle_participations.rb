class CreateBattleParticipations < ActiveRecord::Migration
  def change
    create_table :battle_participations do |t|
      t.integer :character_id
      t.integer :battle_id
      t.boolean :status

      t.timestamps
    end
  end
end
