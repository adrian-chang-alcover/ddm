class Discipline < ActiveRecord::Base
  belongs_to :career
  has_many :subjects
end
