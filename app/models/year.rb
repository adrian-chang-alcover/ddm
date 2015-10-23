class Year < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user unless controller.blank?},
          params: {:id => :id, :name => :name, :career_id => :career_id, :study_plan_id => :study_plan_id}

  belongs_to :career
  belongs_to :study_plan
  has_many :semesters, dependent: :destroy
  has_many :groups, class_name: "Schedule::Group"

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

  def pretty_name_with_career
    "#{self.pretty_name} de #{self.career.name}"
  end

  def subjects
    _subjects = []
    self.semesters.each{|s| _subjects.concat(s.subjects)}
    _subjects
  end
end
