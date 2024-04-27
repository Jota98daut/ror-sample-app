require "test_helper"

class PlatformControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get platform_show_url
    assert_response :success
  end
end
