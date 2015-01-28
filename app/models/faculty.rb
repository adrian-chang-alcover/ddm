class Faculty < ActiveRecord::Base
  include PublicActivity::Model
  tracked

  has_many :careers, dependent: :destroy

  def name
    self.full_name || self.short_name
  end
end
