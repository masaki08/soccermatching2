require "test_helper"

class MessegesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get messeges_index_url
    assert_response :success
  end

  test "should get new" do
    get messeges_new_url
    assert_response :success
  end

  test "should get show" do
    get messeges_show_url
    assert_response :success
  end

  test "should get edit" do
    get messeges_edit_url
    assert_response :success
  end
end
