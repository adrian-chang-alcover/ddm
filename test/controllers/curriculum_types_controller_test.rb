require 'test_helper'

class CurriculumTypesControllerTest < ActionController::TestCase
  setup do
    @curriculum_type = curriculum_types(:one)
    login_as_one
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:curriculum_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create curriculum_type" do
    assert_difference('CurriculumType.count') do
      post :create, curriculum_type: { name: @curriculum_type.name }
    end

    assert_redirected_to curriculum_type_path(assigns(:curriculum_type))
  end

  test "should show curriculum_type" do
    get :show, id: @curriculum_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @curriculum_type
    assert_response :success
  end

  test "should update curriculum_type" do
    patch :update, id: @curriculum_type, curriculum_type: { name: @curriculum_type.name }
    assert_redirected_to curriculum_type_path(assigns(:curriculum_type))
  end

  test "should destroy curriculum_type" do
    assert_difference('CurriculumType.count', -1) do
      delete :destroy, id: @curriculum_type
    end

    assert_redirected_to curriculum_types_path
  end
end
