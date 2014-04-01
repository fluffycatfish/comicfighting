class AddParticipationCapToRounds < ActiveRecord::Migration
  def change
    add_column :rounds, :participation_cap, :integer
  end
end
