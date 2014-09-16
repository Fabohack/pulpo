require 'test_helper'

class StatisticsControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get details" do
    get :details
    assert_response :success
  end

end
