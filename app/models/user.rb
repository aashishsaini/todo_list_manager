class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # has associated records sets
  has_and_belongs_to_many :projects
  has_many :todos

  # checks for admin role
  def admin?
    is_a?(ProjectAdmin)
  end
end
