class CreateRoundParticipations < ActiveRecord::Migration
  def change
    create_table :round_participations do |t|
      t.integer :round_id
      t.integer :character_id
      t.integer :point
      t.integer :late_deduction

      t.timestamps
    end
  end
end
