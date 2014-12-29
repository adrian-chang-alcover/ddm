class EvaluationType < ActiveRecord::Base

  def name
    self.full_name || self.short_name
  end
end
