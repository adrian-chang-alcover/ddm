class Subject < ActiveRecord::Base
  belongs_to :discipline
  belongs_to :semester
  belongs_to :evaluation_type
  belongs_to :curriculum_type

  def name
    self.full_name || self.short_name
  end
end
