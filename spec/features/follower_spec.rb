require 'spec_helper'

describe "Followers of tasks" do
  let!(:user)   { FactoryGirl.create(:user) }
  let!(:user_2) { FactoryGirl.create(:user) }
  let!(:task)   { FactoryGirl.create(:task, user: user) }

  before(:each) do
    Warden.test_mode!
    login_as user
  end

  it "is empty at first" do
    visit "/tasks/#{task.id}/followers"

    expect(page).to_not have_content(user_2.email)
  end

  it "adds follower to a task" do
    visit "/tasks/#{task.id}/followers/new"

    select user_2.email, from: 'follower_user_id'

    click_button 'Create Follower'

    expect(page).to have_content('Follower saved')
  end

  context "once a follower is added" do
    before(:each) do
      task.followers << FactoryGirl.build(:follower, task_id: task.id, user_id: user_2.id)
      task.save!

      logout user
      login_as user_2
    end

    it "is visible in the follower list" do
      visit "/"

      expect(page).to have_content("Tasks I'm following")
      expect(page).to have_content(task.name)
    end
  end
end
