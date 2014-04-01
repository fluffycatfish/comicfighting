class AddParticipatedToTournamentParticipations < ActiveRecord::Migration
  def change
    add_column :tournament_participations, :participated, :boolean
  end
end
