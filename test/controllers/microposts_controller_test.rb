require 'test_helper'

class MicropostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @micropost = microposts(:one)
    # @user = users(:joel)
    # sign_in @user
  end

  # test 'should create micropost' do
  #   assert_difference('Micropost.count', 1) do
  #     post microposts_path, params: {
  #       micropost: {
  #         content: @micropost.content,
  #         user_id: @micropost.user_id
  #       }
  #     }
  #   end
  # end
  #
  # test 'should destroy micropost' do
  #   assert_difference 'Micropost.count', -1 do
  #     delete micropost_path(@micropost)
  #   end
  # end

  test 'should redirect create when not logged in' do
    assert_no_difference 'Micropost.count' do
      post microposts_path, params: { micropost: { content: 'Lorem Ipsum' } }
    end
    assert_redirected_to new_user_session_url
  end

  test 'should redirect destroy when not logged in' do
    assert_no_difference 'Micropost.count' do
      delete micropost_path(@micropost)
    end

    # assert_response :see_other
    assert_redirected_to new_user_session_url
  end
end
