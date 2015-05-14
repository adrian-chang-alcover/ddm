class Schedule::DocentCategory < ActiveRecord::Base
	has_many :professors
end
