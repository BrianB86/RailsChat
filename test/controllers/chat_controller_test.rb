require 'test_helper'

class ChatControllerTest < ActionController::TestCase
  test "should get railsChat" do
    get :railsChat
    assert_response :success
  end

end
