require 'spec_helper'

describe PagesController do

  describe "Visit feed" do

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
