require 'spec_helper'

describe "Followers of tasks" do
  let!(:user)   { FactoryGirl.create(:user) }
  let!(:user_2) { FactoryGirl.create(:user) }
  let!(:task)   { FactoryGirl.create(:task, user: user) }

  before(:each) do
    Warden.test_mode!
    login_as user
  end

  it "adds follower to a task" do
    visit "/tasks/#{task.id}/followers"

    check "follower_#{user_2.id}"

    click_button 'Save'

    expect(page).to have_content('Task saved')
  end

  context "once a follower is added" do
    before(:each) do
      task.followers << user_2
      task.save!

      logout user
      login_as user_2
    end

    it "is visible in the follower list" do

    end
  end
end
