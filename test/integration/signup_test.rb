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
        assert_difference 'User.count', 0 do
            post users_path, params: {user:{name: "user",
                                            email: "penguin@example.com",
                                            password: "password",
                                            password_confirmation: "password"}}
        end
        follow_redirect!
        assert_template 'users/show'
        asser be_logged_in?
    end
end