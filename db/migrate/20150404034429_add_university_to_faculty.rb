class AddUniversityToFaculty < ActiveRecord::Migration
  def change
    add_column :faculties, :university_id, :integer

    uh = University.find_by(short_name: 'UH')
    Faculty.all.each do |faculty|
    	faculty.university = uh
    	faculty.save
    end
  end
end
