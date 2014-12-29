class Year < ActiveRecord::Base
  belongs_to :career
  belongs_to :study_plan
  has_many :semesters, dependent: :destroy

  default_scope {order :name}

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
end
