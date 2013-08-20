class TasksController < ApplicationController
  def index
    sleep 1
    @incomplete_tasks = Task.where(complete: false, user_id: current_user)
    @complete_tasks = Task.where(complete: true, user_id: current_user)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(params[:task])
    @task.user = current_user
    @task.save!
    redirect_to tasks_url
  end

  def update
    @task = Task.find(params[:id])
    @task.update_attributes!(params[:task])
    redirect_to tasks_url
  end

  def destroy
    @task = Task.destroy(params[:id])
    redirect_to tasks_url
  end
end
