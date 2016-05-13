require 'test_helper'

class ChatPmTest < ActiveSupport::TestCase

  def setup
    @user = users(:TestUser2)
    @PM = @user.chat_pms.build(message: "Hello World")
  end

  test "vaild test" do
    assert @PM.valid?
  end

  test "user id should exist" do
    @PM.user_id = nil
    assert_not @PM.valid?
  end

  test "message should exist" do
    @PM.message = "  "
    assert_not @PM.valid?
  end

  test "order should be three first" do
    assert_equal chat_pms(:three), ChatPm.first
  end

end
