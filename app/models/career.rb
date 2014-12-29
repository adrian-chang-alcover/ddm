class Career < ActiveRecord::Base
  belongs_to :faculty
  has_many :disciplines, dependent: :destroy
  has_many :years, dependent: :destroy

  def name
    self.full_name || self.short_name
  end

  def subjects
    _subjects = []
    self.disciplines.each{|d| _subjects.concat(d.subjects)}
    _subjects
  end

  def subjects_by_curriculum_type(curriculum_type)
    self.subjects.select{|s| s.curriculum_type == curriculum_type}
  end

  def subjects_by_year(year)
    self.subjects.select{|s| s.semester.year == year}
  end

  def subjects_by_curriculum_type_and_year(curriculum_type, year)
    self.subjects.select{|s| s.curriculum_type == curriculum_type and s.semester.year == year}
  end

  def subjects_by_evaluation_type(evaluation_type)
    self.subjects.select{|s| s.evaluation_type == evaluation_type}
  end

  def subjects_by_evaluation_type_and_year(evaluation_type, year)
    self.subjects.select{|s| s.evaluation_type == evaluation_type and s.semester.year == year}
  end
end
