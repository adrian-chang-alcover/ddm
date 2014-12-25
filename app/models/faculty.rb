class Faculty < ActiveRecord::Base
  has_many :careers

  def name
    self.full_name || self.short_name
  end
end
