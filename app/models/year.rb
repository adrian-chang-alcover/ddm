class Year < ActiveRecord::Base
  belongs_to :career
  has_many :semesters
end
