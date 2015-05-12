module Schedule
	class Activity < ActiveRecord::Base
		belongs_to :professor
		belongs_to :subject
		belongs_to :group
		belongs_to :local
		belongs_to :docent_day
		belongs_to :turn
		belongs_to :turn_type
	end
end