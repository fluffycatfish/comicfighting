class CharacterSheet < ActiveRecord::Base
	belongs_to :user
	belongs_to :character
	mount_uploader :sheet, SheetUploader
end
