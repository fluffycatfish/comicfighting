class Battle < ActiveRecord::Base
	has_many :characters, :through => :battle_participations
	has_many :battle_participations
	belongs_to :round
	has_many :replies
end
