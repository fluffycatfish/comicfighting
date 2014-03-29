class BattleParticipation < ActiveRecord::Base
	belongs_to :battle
	belongs_to :character
end
