require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
      @user = users(:TestUser2)
  end

  #test "Invalid Login" do
    #get login_path
    #post login_path, session: { name: @user.name, password: "Test123"}
    #assert is_logged_in?
    #assert_template 'chat/railsChat'
    #assert_select "a[href=?]", logout_path
    #delete logout_path
    #assert_not is_logged_in?
    #assert_redirected_to root_url
    #follow_redirect!
  #end
end
