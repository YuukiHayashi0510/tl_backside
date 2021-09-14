require "test_helper"

class PastLecturesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get past_lectures_create_url
    assert_response :success
  end

  test "should get destroy" do
    get past_lectures_destroy_url
    assert_response :success
  end
end
