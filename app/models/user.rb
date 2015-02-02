class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable

  has_and_belongs_to_many :roles

  # Defining admin? ddm? ppd? ... methods
  Role.all.each do |role|
    define_method("#{role.name}?") do
      self.roles.include?(role)
    end
  end

  def faculty
    case self.email
      when /@matcom.uh.cu/
        Faculty.find_by_full_name('Matemática y Computación')
      when /@rect.uh.cu/
        Faculty.find_by_full_name('Matemática y Computación')
      when /@lex.uh.cu/
        Faculty.find_by_full_name('Derecho')
    end
  end
end
