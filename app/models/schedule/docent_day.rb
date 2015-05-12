class Schedule::DocentDay < ActiveRecord::Base
	belongs_to :docent_week
end
