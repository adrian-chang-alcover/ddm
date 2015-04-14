class CareerAccreditation < ActiveRecord::Base
	belongs_to :career
	belongs_to :university
	belongs_to :accreditation_category
end
