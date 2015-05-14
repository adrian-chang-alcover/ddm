class Schedule::Distribution < ActiveRecord::Base
	belongs_to :professor
	belongs_to :group
	belongs_to :subject
end
