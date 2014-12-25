class Subject < ActiveRecord::Base
  belongs_to :discipline
  belongs_to :semester
  belongs_to :evaluation_type
end
