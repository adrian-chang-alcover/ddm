module Schedule
	class Local < ActiveRecord::Base
		has_many :turn_types
	end
end
