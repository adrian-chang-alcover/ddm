class StudyModality < ActiveRecord::Base
  has_many :careers, dependent: :destroy
end
