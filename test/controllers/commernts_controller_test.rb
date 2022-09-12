require "test_helper"

class CommerntsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get commernts_index_url
    assert_response :success
  end

  test "should get new" do
    get commernts_new_url
    assert_response :success
  end

  test "should get show" do
    get commernts_show_url
    assert_response :success
  end

  test "should get edit" do
    get commernts_edit_url
    assert_response :success
  end
end
