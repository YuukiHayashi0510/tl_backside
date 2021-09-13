require "test_helper"

class CurrentLecturesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get current_lectures_create_url
    assert_response :success
  end

  test "should get destroy" do
    get current_lectures_destroy_url
    assert_response :success
  end
end
