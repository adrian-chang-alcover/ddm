module Schedule
	class TurnType < ActiveRecord::Base
		has_many :locals
	end	
end
