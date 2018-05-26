class Todo < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  validates :name, presence: true

  before_save :add_user_to_project_list

  # assigns the user to the project list if not added before
  def add_user_to_project_list
    project.users << user
  end
end
