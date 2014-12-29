class Discipline < ActiveRecord::Base
  belongs_to :career
  has_many :subjects, dependent: :destroy

  def subjects_by_curriculum_type(curriculum_type)
    self.subjects.select{|s| s.curriculum_type==curriculum_type}
  end

  def subjects_by_year_name(year_name)
    self.subjects.select{|s| s.semester.year.name == year_name}
  end

  def subjects_by_curriculum_type_and_year_name(curriculum_type, year_name)
    self.subjects.select{|s| s.curriculum_type==curriculum_type and s.semester.year.name == year_name}
  end
end
