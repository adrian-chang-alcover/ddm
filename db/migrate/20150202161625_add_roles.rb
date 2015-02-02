class AddRoles < ActiveRecord::Migration
  def change
    Role.find_or_create_by(name: 'admin')
    Role.find_or_create_by(name: 'ddm')
    Role.find_or_create_by(name: 'decano')
    Role.find_or_create_by(name: 'vicedecano')
    Role.find_or_create_by(name: 'ppd')
    Role.find_or_create_by(name: 'pp')
  end
end
