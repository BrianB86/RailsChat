require 'test_helper'

class RailsChatControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
    assert_select "label", "Username"
    assert_select "label", "Password"
  end

end
