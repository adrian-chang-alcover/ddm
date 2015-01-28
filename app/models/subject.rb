class Subject < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }

  belongs_to :discipline
  belongs_to :semester
  belongs_to :evaluation_type
  belongs_to :curriculum_type

  default_scope {order :number}

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
