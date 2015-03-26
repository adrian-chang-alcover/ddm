class SettingStudyModalityColumnInCareerTable < ActiveRecord::Migration
  def up
    crd = StudyModality.find_by_short_name('CRD')
    Career.all.each do |career|
      career.study_modality = crd
      career.save
    end
  end

  def down
    Career.all.each do |career|
      career.study_modality = nil
      career.save
    end
  end
end
