class ModifyingRoles < ActiveRecord::Migration
  def change
    Role.find_or_create_by(name: 'admin'){|r|r.priority=1}
    Role.find_or_create_by(name: 'ddm'){|r|r.priority=2}
    Role.find_or_create_by(name: 'decano'){|r|r.priority=3}
    Role.find_or_create_by(name: 'vicedecano'){|r|r.priority=4}
    Role.find_or_create_by(name: 'ppd'){|r|r.priority=5}
    Role.find_or_create_by(name: 'pp'){|r|r.priority=5}
  end
end
