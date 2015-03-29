class EvaluationType < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user unless controller.blank?},
          params: {:id => :id, :short_name => :short_name, :full_name => :full_name}

  def name
    self.full_name || self.short_name
  end
end
