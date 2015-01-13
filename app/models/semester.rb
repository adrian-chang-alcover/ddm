class Semester < ActiveRecord::Base
  belongs_to :year
  has_many :subjects, dependent: :destroy

  default_scope {order :name}

  def pretty_name
    case name
      when '1'
        'primer semestre'
      when '2'
        'segundo semestre'
      else
        name
    end
  end

  def pretty_name_with_year_and_career
    "#{self.pretty_name} de #{self.year.pretty_name_with_career}"
  end

  def name_slug
    I18n.transliterate(self.name).downcase.squish
  end

  def relevant_subjects
    case self.name_slug
      when 'practica'
        self.year.subjects.collect{|s| s.practical_hours > 0 and not s.semester.name_slug == 'practica'}
      when 'anual'
        []
      else
        anual = self.year.semesters.find{|s| s.name_slug == 'anual'}
        anual.blank? ? [] : anual.subjects
    end
  end

end
