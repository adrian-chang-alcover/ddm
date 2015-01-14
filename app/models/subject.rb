class Subject < ActiveRecord::Base
  belongs_to :discipline
  belongs_to :semester
  belongs_to :evaluation_type
  belongs_to :curriculum_type

  default_scope {order :number}

  def name
    self.full_name || self.short_name
  end

  def total_hours
    self.class_hours + self.practical_hours
  end

  def career
    self.discipline.career
  end
end
