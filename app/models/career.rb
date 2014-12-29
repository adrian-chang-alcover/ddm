class Career < ActiveRecord::Base
  belongs_to :faculty
  has_many :disciplines, dependent: :destroy
  has_many :years, dependent: :destroy

  def name
    self.full_name || self.short_name
  end

  def subjects
    _subjects = []
    self.disciplines.each{|d| _subjects.concat(d.subjects)}
    _subjects
  end
end
