class EvaluationType < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }

  def name
    self.full_name || self.short_name
  end
end
