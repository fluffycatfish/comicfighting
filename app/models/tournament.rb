class Tournament < ActiveRecord::Base
	has_many :tournament_participations
	has_many :rounds
	has_many :characters, :through => :tournament_participations
end
