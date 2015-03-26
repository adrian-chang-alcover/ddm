class Subject < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user unless controller.blank?},
          params: {:id => :id, :short_name => :short_name, :full_name => :full_name, :discipline_id => :discipline_id,
                   :semester_id => :semester_id, :class_hours_1 => :class_hours_1, :evaluation_type_id => :evaluation_type_id,
                   :practical_hours => :practical_hours, :curriculum_type_id => :curriculum_type_id,
                   :dictum_or_resoluteness => :dictum_or_resoluteness, :number => :number, :class_hours_2 => :class_hours_2}

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
