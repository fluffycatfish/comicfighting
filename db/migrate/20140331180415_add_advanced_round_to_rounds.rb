class AddAdvancedRoundToRounds < ActiveRecord::Migration
  def change
    add_column :rounds, :advanced_round, :boolean
  end
end
