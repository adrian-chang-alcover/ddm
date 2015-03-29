class Faculty < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user unless controller.blank?},
          params: {:id => :id, :short_name => :short_name, :full_name => :full_name, :dean => :dean}

  has_many :careers, dependent: :destroy
  has_many :users, dependent: :destroy

  def name
    self.full_name || self.short_name
  end
end
