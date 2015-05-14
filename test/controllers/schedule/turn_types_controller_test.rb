require 'test_helper'

class Schedule::TurnTypesControllerTest < ActionController::TestCase
  setup do
    @schedule_turn_type = schedule_turn_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:schedule_turn_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create schedule_turn_type" do
    assert_difference('Schedule::TurnType.count') do
      post :create, schedule_turn_type: { full_name: @schedule_turn_type.full_name, short_name: @schedule_turn_type.short_name }
    end

    assert_redirected_to schedule_turn_type_path(assigns(:schedule_turn_type))
  end

  test "should show schedule_turn_type" do
    get :show, id: @schedule_turn_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @schedule_turn_type
    assert_response :success
  end

  test "should update schedule_turn_type" do
    patch :update, id: @schedule_turn_type, schedule_turn_type: { full_name: @schedule_turn_type.full_name, short_name: @schedule_turn_type.short_name }
    assert_redirected_to schedule_turn_type_path(assigns(:schedule_turn_type))
  end

  test "should destroy schedule_turn_type" do
    assert_difference('Schedule::TurnType.count', -1) do
      delete :destroy, id: @schedule_turn_type
    end

    assert_redirected_to schedule_turn_types_path
  end
end
