class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable

  has_and_belongs_to_many :roles
  belongs_to :faculty
  belongs_to :career

  has_tasks

  # validates :faculty_id, presence: true
  # validate { |user| user.career.faculty == user.faculty unless user.career.blank? }

  # Defining admin? ddm? ppd? ... methods
  if table_exists?
    Role.all.each do |role|
      define_method("#{role.name.gsub(' ', '_')}?") do
        self.roles.include?(role)
      end
    end
  end

  def priority
    self.roles.min_by{|r|r.priority}.priority
  end

  def has_role?(role)
    self.roles.include?(role)
  end

end
