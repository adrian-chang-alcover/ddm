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

  def weeks
    return 16
    self.end_date.cweek - self.begin_date.cweek
  end
end
