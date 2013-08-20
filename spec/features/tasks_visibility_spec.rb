require 'spec_helper'

describe "Task Visibility" do
  let(:user) { FactoryGirl.create(:user) }

  before(:each) do
    Warden.test_mode!
    login_as user
  end

  it "is visible only to the task owner" do
    pending
    user_2 = FactoryGirl.create(:user)
    task   = FactoryGirl.create(:task, user: user)

    visit '/'

    expect(page).to have_content 'Logged'
    expect(page).to_not have_content task.name
  end
end
