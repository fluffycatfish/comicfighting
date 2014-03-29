class CreateTournamentParticipations < ActiveRecord::Migration
  def change
    create_table :tournament_participations do |t|
      t.integer :character_id
      t.integer :tournament_id

      t.timestamps
    end
  end
end
