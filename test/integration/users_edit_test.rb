require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
      @user = users(:TestUser2)
  end

  test "Invalid edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), user: { name: "", password: "poo", password_confirmation: "bar" }
    assert_template 'users/edit'
  end

  test "Valid edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    name = "testuser2"
    patch user_path(@user), user: { name: name, password: "", password_confirmation: ""}
    @user.reload
    assert_equal name, @user.name.downcase
  end

  test "Forward user to thier own profile page" do
    get edit_user_path(@user)
    log_in_as(@user)
    assert_redirected_to edit_user_path(@user)
    name = "testuser2"
    patch user_path(@user), user: { name: name, password: "", password_confirmation: ""}
    @user.reload
    assert_equal name, @user.name.downcase
  end
end
