class FollowersController < ApplicationController
  def index
    @task = Task.find(params[:task_id])
    @followers = Follower.where(task_id: @task)
  end

  def new
    @task = Task.find(params[:task_id])
    @follower = Follower.new
    # TODO: Dirty trick because I couldn't use LEFT OUTER JOIN properly with sqlite
    if @task.followers.empty?
      @users = User.all
    else
      @users = User.where('id NOT IN (?)', @task.followers.map(&:user_id).uniq)
    end
  end

  def create
    @task = Task.find(params[:task_id])
    @follower = Follower.create(params[:follower])
    @follower.task = @task
    @follower.save!
    flash[:notice] = "Follower saved."

    redirect_to task_followers_url
  end
end
