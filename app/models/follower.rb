class Follower < ActiveRecord::Base
  attr_accessible :user_id, :task_id

  belongs_to :task
  belongs_to :user
end
