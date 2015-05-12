
	class Professor < ActiveRecord::Base
		belongs_to :scientific_category
		belongs_to :docent_category
	end