class CurriculumType < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user },
          params: {:id => :id, :name => :name}
end
