class Career < ActiveRecord::Base
  belongs_to :faculty
  has_many :disciplines
  has_many :years
end
