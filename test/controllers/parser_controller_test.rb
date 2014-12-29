require 'test_helper'

class ParserControllerTest < ActionController::TestCase
  test "should get ppd_vivo" do
    get :ppd_vivo
    assert_response :success
  end

end
