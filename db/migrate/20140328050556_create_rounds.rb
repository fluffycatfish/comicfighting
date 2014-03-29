class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :round_no
      t.string :name
      t.text :about
      t.integer :turn_duration
      t.datetime :start_date
      t.datetime :vote_date
      t.datetime :calc_date

      t.timestamps
    end
  end
end
