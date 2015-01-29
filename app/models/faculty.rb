class Faculty < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user },
          params: {:id => :id, :short_name => :short_name, :full_name => :full_name, :dean => :dean}

  has_many :careers, dependent: :destroy

  def name
    self.full_name || self.short_name
  end
end
