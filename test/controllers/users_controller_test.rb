require 'test_helper'

class UsersControllerTest < ActionController::TestCase

def setup
  @user = users(:TestUser2)
  @user2 = users(:TestUser3)
end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "Should have a log in pop up when not logged in (edit)" do
    get :edit, id: @user
  end

  test "Should have login pop up when not logged in (patch)" do
    patch :update, id: @user, user: {name: @user.name}
  end

  test "Should have a log in pop up when not logged in as the correct user (edit)" do
    log_in_as(@user2)
    get :edit, id: @user
  end

  test "Should have login pop up when not logged in as the correct user (patch)" do
    log_in_as(@user2)
    patch :update, id: @user, user: {name: @user.name}
  end

end
