require 'test_helper'

class Cms::DirectivesControllerTest < ActionController::TestCase
  test "should get network_modal" do
    get :network_modal
    assert_response :success
  end

  test "should get affiliate_form" do
    get :affiliate_form
    assert_response :success
  end

end
