require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Penguin User", email: "user@example.com")
  end

  test "valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = ""
    assert_not @user.valid?
  end

  test "mail should be present" do
    @user.email = " "
    assert_not @user.valid?
  end

  test "length of name" do
    @user.name = "a"*20
  end

  test "length of email" do
    @user.email = "a"*200 + "@example.com"
  end

  # test "valid email address" do
  #   valid_email_addresses = 
  # end
end
