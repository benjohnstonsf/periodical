require 'spec_helper'

describe PagesController do

  describe "Visit feed" do
    let(:user) { FactoryGirl.create(:user) }
      visit new_user_session_path 
      fill_in "email",    with: user.email
      fill_in :password, with: user.password
      click_button "Sign in"
    it "returns http success" do
      visit root_path
      response.should be_success
    end
    
    it "has a link to the current users profile" do
      visit root_path
      page.should have_content "Profile"
    end
  end

end
