class Discipline < ActiveRecord::Base
  belongs_to :career
  has_many :subjects, dependent: :destroy

  def subjects_by_curriculum_type(curriculum_type)
    self.subjects.select{|s| s.curriculum_type==curriculum_type}
  end

  def subjects_by_year(year)
    self.subjects.select{|s| s.semester.year == year}
  end

  def subjects_by_curriculum_type_and_year(curriculum_type, year)
    self.subjects.select{|s| s.curriculum_type==curriculum_type and s.semester.year == year}
  end
end
