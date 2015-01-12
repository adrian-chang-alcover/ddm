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

end
