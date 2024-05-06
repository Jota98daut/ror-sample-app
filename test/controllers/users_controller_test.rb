require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:joel)
    @platform = platforms(:plat)
    sign_in @user
    @user.subscribe @platform
  end

  test 'should get index' do
    get users_url
    assert_response :success
  end

  test 'should show user' do
    get user_url(@user)
    assert_response :success
  end

  test 'subscribing again should do nothing' do
    assert @user.subscribed? @platform
    assert_no_difference '@user.platforms.count' do
      post subscribe_path, params: { platform_id: @platform.id }
    end
  end

  test 'should subscribe to platform' do
    platform = Platform.create!(name: 'platform')

    assert_difference '@user.platforms.count', 1 do
      post subscribe_path, params: { platform_id: platform.id }
    end
    assert @user.subscribed? platform
  end

  test 'should unsubscribe to platform' do
    assert_difference '@user.platforms.count', -1 do
      delete unsubscribe_path, params: { platform_id: @platform.id }
    end
    assert_not @user.subscribed? @platform
  end
end
