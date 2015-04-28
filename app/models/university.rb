class University < ActiveRecord::Base
	has_many :faculties
	has_and_belongs_to_many :careers

	def name
		full_name || short_name
	end
end
