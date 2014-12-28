class Year < ActiveRecord::Base
  belongs_to :career
  belongs_to :study_plan
  has_many :semesters, dependent: :destroy
end
