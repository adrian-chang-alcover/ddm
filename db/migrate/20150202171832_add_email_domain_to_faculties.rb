class AddEmailDomainToFaculties < ActiveRecord::Migration
  def change
    add_column :faculties, :email_domain, :string
  end
end
