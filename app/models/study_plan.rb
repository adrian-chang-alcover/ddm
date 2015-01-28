class StudyPlan < ActiveRecord::Base
  include PublicActivity::Model
  tracked

  has_many :years
end
