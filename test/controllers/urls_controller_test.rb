require 'test_helper'

class UrlsControllerTest < ActionDispatch::IntegrationTest
  test "should get root path" do
    get root_path
    assert_response :success
  end
end
