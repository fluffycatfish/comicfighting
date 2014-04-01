class AddAdvancedRoundToRoundParticipations < ActiveRecord::Migration
  def change
    add_column :round_participations, :advanced_round, :boolean
  end
end
