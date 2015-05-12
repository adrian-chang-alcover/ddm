class Schedule::P1 < ActiveRecord::Base
	belongs_to :subject
	belongs_to :docent_week
	belongs_to :turn_type
end
