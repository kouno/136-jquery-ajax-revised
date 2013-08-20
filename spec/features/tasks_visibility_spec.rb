require 'spec_helper'

describe "Task Visibility" do
  let(:user) { FactoryGirl.create(:user) }

  before(:each) do
    Warden.test_mode!
    login_as user
  end

  it "is visible only to the task owner" do
    visit '/'
    expect(page).to have_content 'Logged'
  end
end
