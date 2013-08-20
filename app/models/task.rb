class Task < ActiveRecord::Base
  attr_accessible :complete, :name, :user_id

  belongs_to :user

  has_many :followers
end
