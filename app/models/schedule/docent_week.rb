class Schedule::DocentWeek < ActiveRecord::Base
	has_many :docent_days
	belongs_to :year
	belongs_to :semester
end
