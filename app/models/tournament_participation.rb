class TournamentParticipation < ActiveRecord::Base
	belongs_to :character
	belongs_to :tournament
	has_many :round_participations
	validates :character_id, :uniqueness => {:scope => :tournament_id}
end
