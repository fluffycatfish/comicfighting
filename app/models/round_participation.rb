class RoundParticipation < ActiveRecord::Base
	belongs_to :round
	belongs_to :tournament_participation
	belongs_to :rounds_participation
	validates :character_id, :uniqueness => {:scope => :round_id}
end
