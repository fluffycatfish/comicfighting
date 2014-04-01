class AddStartedToRounds < ActiveRecord::Migration
  def change
    add_column :rounds, :started, :boolean
  end
end
