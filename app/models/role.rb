class Role < ActiveRecord::Base
  has_and_belongs_to_many :users

  # default_scope {order :priority}
end
