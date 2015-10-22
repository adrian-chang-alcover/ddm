<<<<<<< HEAD
class Schedule::TurnType < ActiveRecord::Base
=======
module Schedule
	class TurnType < ActiveRecord::Base
		has_many :locals
	end	
>>>>>>> feature/test
end
