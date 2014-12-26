class Career < ActiveRecord::Base
  belongs_to :faculty
  has_many :disciplines, dependent: :destroy
  has_many :years, dependent: :destroy

  def name
    self.full_name || self.short_name
  end
end
