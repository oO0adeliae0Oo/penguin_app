require 'test_helper'
class Signuptest < ActionDispatch::IntegrationTest

    test "invalid information" do
        get signup_path
        assert_no_difference 'User.count' do
            post users_path, params: {user:{name:"",
                                            email: "penguin@example.com",
                                            password: "hoge",
                                            password_confirmation: "hoge"}}
        end
        assert_template 'users/new'
    end

    test "valid information" do
        get signup_path
        assert_difference 'User.count', 1 do
            post users_path, params: {user:{name:"",
                                            email: "penguin@example.com",
                                            password: "hoge",
                                            password_confirmation: "hoge"}}
        end
        follow_redirect!
        assert_template 'users/show'
    end
end