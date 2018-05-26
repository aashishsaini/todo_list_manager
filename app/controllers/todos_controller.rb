class TodosController < ApplicationController
  load_and_authorize_resource
  before_action :initialize_todo, except: [:create]

  # methods that only needs initialize objects
  def edit; end
  def new; end
  def assign_user; end

  # will create a new task to the project list
  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      flash[:success] = 'Todo Created Successfully'
      redirect_to project_path(@todo.project)
    else
      flash[:error] = @todo.errors.full_messages.join("<br>").html_safe
      render action: :new
    end
  end

  # used to updated the task with status only
  def update
    if @todo.update(todo_params)
      flash[:success] = 'Status Updated Successfully'
    else
      flash[:error] = @todo.errors.full_messages.join("<br>").html_safe
    end
    redirect_to project_path(@todo.project)
  end

  private
  def initialize_todo
    @todo = params[:id].present? ? Todo.find(params[:id]) : Todo.new(project_id: params[:project_id])
  end

  def todo_params
    params.require(:todo).permit(:status, :name, :description, :project_id, :user_id)
  end
end
