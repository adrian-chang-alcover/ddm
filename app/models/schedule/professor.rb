class Schedule::Professor < ActiveRecord::Base
	belongs_to :scientific_degree
	belongs_to :docent_category
	belongs_to :faculty
end