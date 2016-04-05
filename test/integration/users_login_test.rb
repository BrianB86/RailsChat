require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  test "Invalid Login" do
    get login_path
    assert_template 'sessions/new'
    post login_path, session: { name: "", password: ""}
    assert_template 'shared/_error_messages'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end
end
