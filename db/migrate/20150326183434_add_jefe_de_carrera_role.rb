class AddJefeDeCarreraRole < ActiveRecord::Migration
  def change
  	role = Role.find_or_create_by(name: 'jefe de carrera', priority: 5)

  	ppd = Role.find_by(name: 'ppd')
  	ppd.priority = 6
  	ppd.save

  	pp = Role.find_by(name: 'pp')
  	pp.priority = 6
  	pp.save
  end
end
