require 'test_helper'

class PrivateMessagesControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

end
