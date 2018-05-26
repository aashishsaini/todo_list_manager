class ProjectsController < ApplicationController
  load_and_authorize_resource
  before_action :initialize_project, except: [:create]

  # show dashboard to developer and admin
  def index
    @projects = current_user.admin? ? Project.includes(:developers, :todos).all : current_user.projects.includes(:todos)
  end

  # methods that only needs initialize objects
  def show; end
  def new; end

  # used to add the new project in system
  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:success] = 'Project created successfully'
      redirect_to projects_path
    else
      flash[:error] = @project.errors.full_messages.join("<br>").html_safe
      render action: :new
    end
  end

  private
  # will return project as well as todos
  # project will be used to admin
  # todos will extract the list for individual users
  def initialize_project
    if params[:id].present?
         @project = Project.find(params[:id])
       unless current_user.admin?
         @todos = current_user.todos.where(project_id: params[:id])
       end
   else
     @project = Project.new
   end
  end

  def project_params
    params.require(:project).permit(:name, :description, :user_id)
  end
end
