require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post signup_path, params: { user: { name:  "",
                                         email: "user@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
    end
    # assert_templateは古い?→gemfileに「gem 'rails-controller-testing'」追記
    assert_template 'users/new'
    # エラーメッセージをテスト
    assert_select 'div#error_explanation'
    assert_select 'div.alert'
    assert_select 'div.alert-danger'
    assert_select 'form[action="/signup"]'
  end

  # チュートリアル7.4.4↓ユーザーが作成されたか
  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name:  "Example User",
                                         email: "user@example.com",
                                         password:              "password",
                                         password_confirmation: "password" } }
    end
    # postリクエスト送信結果を見て、リダイレクト先に移動するメソッド
    follow_redirect!
    assert_template 'users/show'
    assert_not flash.empty?
  end
end
