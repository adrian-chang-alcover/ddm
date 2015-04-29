module Schedule
	class Group < ActiveRecord::Base
		belongs_to :year
	end
end
