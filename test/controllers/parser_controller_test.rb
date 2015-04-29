require 'test_helper'

class ParserControllerTest < ActionController::TestCase
  setup :login_as_admin

  test "should get ppd_vivo" do
    get :ppd_vivo
    assert_response :success
  end

end
