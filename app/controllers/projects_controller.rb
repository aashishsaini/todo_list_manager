class ProjectsController < ApplicationController
  load_and_authorize_resource

  before_action :initialize_project, except: [:create]
  def index
    @projects = current_user.admin? ? Project.includes(:users, :todos).all : current_user.projects.includes(:todos)
  end

  def show; end

  def new; end

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
