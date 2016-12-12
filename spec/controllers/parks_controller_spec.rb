require 'rails_helper'

RSpec.describe ParksController, type: :controller do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  # describe "Submit form" do
  #
  #   before do
  #     visit /edit_account_settings(@user)
  #     fill_in "username", :with => "fo"
  #     click_button "SAVE"
  #   end
  #
  #   it "should not sumbit if user name is less than 3 characters" do
  #     page.should have_content "your error message"
  #   end
  #
  #   it "should create the user and redirect to blah_path" do
  #     current_path.should eq blah_path
  #   end
  #
  #   it "should add user in users table" do
  #     expect { user.create }.to change(User, :count).from(0).to(1)
  #   end
  #
  # end

end
