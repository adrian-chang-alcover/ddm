class Career < ActiveRecord::Base
  belongs_to :faculty
  has_many :disciplines
  has_many :years

  def name
    self.full_name || self.short_name
  end
end
