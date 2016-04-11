class Year < ActiveRecord::Base

  belongs_to :career
  belongs_to :study_plan
  has_many :semesters, dependent: :destroy
  has_many :groups, class_name: "Schedule::Group"

  default_scope {order :name}

  has_paper_trail

  def pretty_name
    case name
      when '1'
        'primer año'
      when '2'
        'segundo año'
      when '3'
        'tercer año'
      when '4'
        'cuarto año'
      when '5'
        'quinto año'
      when '6'
        'sexto año'
      else
        name
    end
  end

  def pretty_name_with_career
    "#{self.pretty_name} de #{self.career.name}"
  end

  def subjects
    _subjects = []
    self.semesters.each{|s| _subjects.concat(s.subjects)}
    _subjects
  end
end
