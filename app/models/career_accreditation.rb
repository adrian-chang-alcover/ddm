class CareerAccreditation < ActiveRecord::Base
	belongs_to :career
	belongs_to :university
	belongs_to :accreditation_category

	def previous_accreditations
		CareerAccreditation.where(career_id: self.career_id, university_id: self.university_id).where.not(id: self.id).order(year: :desc)
	end

	def accreditations_in_others_universities
		CareerAccreditation.where(career_id: self.career_id).where.not(university_id: self.university_id).order(year: :desc)
	end
end
