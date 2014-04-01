class Character < ActiveRecord::Base
	validates :name, uniqueness: true
	belongs_to :user
	has_many :character_sheets
	has_many :tournaments, :through => :tournament_participations
	has_many :battles, :through => :battle_participations
	has_many :battle_participations
	has_many :tournament_participations
end
