class Tournament < ActiveRecord::Base
	has_many :tournament_participation
	has_many :rounds
end
