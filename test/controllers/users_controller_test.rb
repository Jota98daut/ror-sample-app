require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test 'should get index' do
    get users_url
    assert_response :success
  end

  test 'should show user' do
    get user_url(@user)
    assert_response :success
  end

  test 'should subscribe to platform' do
    @user = User.create!(username: 'a', email: 'a@example.com', password: '1234567', password_confirmation: '1234567')
    @platform = Platform.create!(name: 'platform')

    sign_in @user
    assert_difference '@user.platforms.count', 1 do
      post '/users/subscribe', params: { platform_id: @platform.id }
    end
    assert @user.subscribed? @platform
  end
end
