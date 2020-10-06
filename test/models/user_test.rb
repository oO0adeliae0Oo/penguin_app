require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Penguin User", email: "user@penguin.com", 
            password: "hogefuga", password_confirmation: "hogefuga")
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

  test "unique email address" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "saved as lowercase email" do
    mix_case_email = "User@PenGuin.cOm"
    @user.email = mix_case_email
    @user.save
    assert_equal mix_case_email.downcase, @user.reload.email
  end

  test "password should be present" do
    @user.password = @user.password_confirmation = " "*5
    assert_not @user.valid?
  end

  test "password have a minimum length" do
    @user.password = @user.password_confirmation = "a"*4
    assert_not @user.valid?
  end
end
