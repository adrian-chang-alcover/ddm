class Faculty < ActiveRecord::Base
  
  has_many :careers, dependent: :destroy
  has_many :users, dependent: :destroy
  belongs_to :university

  def name
    self.full_name || self.short_name
  end
end
