require 'test_helper'

class RepositorioControllerTest < ActionController::TestCase
  setup :login_as_admin

  test "should get index" do
    get :index
    assert_response :success
  end

end
