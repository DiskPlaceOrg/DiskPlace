require 'test_helper'

class FileKeysControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get file_keys_create_url
    assert_response :success
  end

  test "should get show" do
    get file_keys_show_url
    assert_response :success
  end

  test "should get destroy" do
    get file_keys_destroy_url
    assert_response :success
  end

end
