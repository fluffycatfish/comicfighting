class AddParticipationCapToTournaments < ActiveRecord::Migration
  def change
    add_column :tournaments, :participation_cap, :integer
  end
end
