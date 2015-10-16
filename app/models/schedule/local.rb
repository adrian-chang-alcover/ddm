<<<<<<< HEAD
class Schedule::Local < ActiveRecord::Base
	belongs_to :faculty
end
=======
module Schedule
	class Local < ActiveRecord::Base
		has_many :turn_types
	end
end
>>>>>>> feature/test
