class Round < ActiveRecord::Base
	belongs_to :tournament
	has_many :battles
	has_many :round_participations
end
