class Todo < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  validates :name, presence: true
  validates :description, presence: true

  before_save :add_user_to_project_list

  def add_user_to_project_list
    project.users << user
  end
end
