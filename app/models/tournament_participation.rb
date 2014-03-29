class TournamentParticipation < ActiveRecord::Base
	belongs_to :character
	belongs_to :tournament
end
