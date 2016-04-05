require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "Invalid signup information" do
    assert_no_difference 'User.count' do
      post users_path, user: { name: "",
                                password: "nope",
                                password_confirmation: "poop"}
    end
  end

  test "Valid signup information" do
    assert_difference 'User.count', 1 do
      post_via_redirect_ users_path, user: { name: Brian, password: "Woody123", password_confirmation: "Woody123"}
    end
  end
end
