require 'test_helper'

class PpdControllerTest < ActionController::TestCase
  setup :login_as_admin

  test "should get report" do
    get :report
    assert_response :success
  end

end
