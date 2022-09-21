require "test_helper"

class EntrysControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get entrys_show_url
    assert_response :success
  end

  test "should get index" do
    get entrys_index_url
    assert_response :success
  end

  test "should get edit" do
    get entrys_edit_url
    assert_response :success
  end
end
