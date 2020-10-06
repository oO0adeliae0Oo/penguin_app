require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Penguin User", email: "user@penguin.com")
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

  test "valid email address" do
    valid_email_address = %w[user@penguin.com USER@PenGuin.COM U-Se_R@penguin.adeliae.com]

    valid_email_address.each do |valid_email_address|
      @user.email = valid_email_address
      assert @user.valid?, "#{valid_email_address.inspect} should be valid"
    end
  end
end
