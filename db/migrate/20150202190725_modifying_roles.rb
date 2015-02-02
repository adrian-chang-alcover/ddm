class ModifyingRoles < ActiveRecord::Migration
  def change
    admin = Role.find_by_name('admin')
    admin.priority = 1
    admin.save

    ddm = Role.find_by_name('ddm')
    ddm.priority = 2
    ddm.save

    decano = Role.find_by_name('decano')
    decano.priority = 3
    decano.save

    vicedecano = Role.find_by_name('vicedecano')
    vicedecano.priority = 4
    vicedecano.save

    ppd = Role.find_by_name('ppd')
    ppd.priority = 5
    ppd.save

    pp = Role.find_by_name('pp')
    pp.priority = 5
    pp.save
  end
end
