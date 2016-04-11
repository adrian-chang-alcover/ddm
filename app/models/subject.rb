class Subject < ActiveRecord::Base

  belongs_to :discipline
  belongs_to :semester
  belongs_to :evaluation_type
  belongs_to :curriculum_type

  validates :full_name, :discipline, :semester, :curriculum_type, presence: true

  default_scope {order :number}

  has_paper_trail

  def name
    self.full_name || self.short_name
  end

  def total_hours
    self.class_hours_1 + self.class_hours_2 + self.practical_hours
  end

  def career
    self.discipline.career
  end

  def year
    self.semester.year
  end
end
