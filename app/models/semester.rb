class Semester < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }

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
    if self.practica?
      self.year.subjects.select{|s| s.practical_hours > 0 and not s.semester.name_slug == 'practica'}
    elsif self.anual?
      []
    else
      anual = self.year.semesters.find{|s| s.name_slug == 'anual'}
      anual.blank? ? [] : anual.subjects
    end
  end

  def practica?
    self.name_slug == 'practica'
  end

  def anual?
    self.name_slug == 'anual'
  end

end
