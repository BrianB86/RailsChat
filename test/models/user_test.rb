require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "TestUser", password: "tester12", password_confirmation: "tester12")
  end

  test "should be valid" do
      assert @user.valid?
  end

  test "name should exist" do
    @user.name = "  "
    assert_not @user.valid?
  end

  test "name should not be over 20 characters" do
    @user.name = "D" * 21
    assert_not @user.valid?
  end

  test "the name should be unique" do
    duplicate_user = @user.dup
    duplicate_user_name = @user.name.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "password should not be blank" do
    @user.password = @user.password_confirmation = " " * 8
    assert_not @user.valid?
  end

  test "password should be greater than 7 characters" do
    @user.password = @user.password_confirmation = "a" * 8
    assert_not @user.valid?
  end

  test "password must include numbers" do
      @user.password = @user.password_confirmation = "abcefgh"
      assert_not @user.valid?
  end

  test "password cannot have spaces." do
    @user.password = @user.password_confirmation = "abc12 34 "
    assert_not @user.valid?
  end

end
