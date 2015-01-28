class EvaluationType < ActiveRecord::Base
  include PublicActivity::Model
  tracked

  def name
    self.full_name || self.short_name
  end
end
