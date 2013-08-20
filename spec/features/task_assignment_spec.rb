require 'spec_helper'

describe "Task Assignment" do
  let!(:user)   { FactoryGirl.create(:user) }
  let!(:user_2) { FactoryGirl.create(:user) }
  let!(:task)   { FactoryGirl.create(:task, user: user) }

  before(:each) do
    Warden.test_mode!
    login_as user
  end

  it "can assign task to other user" do
    visit "/tasks/#{task.id}/edit"

    select user_2.email, from: "task_user_id"

    click_button 'Save'

    expect(page).to have_content('Task saved')
    expect(page).to_not have_content(task.name)
  end
end
