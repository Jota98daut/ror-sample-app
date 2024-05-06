require "test_helper"

class PlatformControllerTest < ActionDispatch::IntegrationTest
  setup do
    @platform = platforms(:plat)
  end

  test 'should get show' do
    get platform_url(@platform)
    assert_response :success
  end

  test 'should get index' do
    get platforms_url
    assert_response :success
  end
end
