require 'spec_helper'

describe "the signin process", :type => :feature do
  let(:user) { FactoryGirl.create(:user) }

  it "signs me in" do
    visit '/'
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_button 'Sign in'
    expect(page).to have_content "Logged as #{user.email}"
  end
end
