require 'test_helper'

class Schedule::P1sControllerTest < ActionController::TestCase
  setup do
    @schedule_p1 = schedule_p1s(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:schedule_p1s)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create schedule_p1" do
    assert_difference('Schedule::P1.count') do
      post :create, schedule_p1: { docent_week_id: @schedule_p1.docent_week_id, name: @schedule_p1.name, number: @schedule_p1.number, subject_id: @schedule_p1.subject_id, turn_type_id: @schedule_p1.turn_type_id }
    end

    assert_redirected_to schedule_p1_path(assigns(:schedule_p1))
  end

  test "should show schedule_p1" do
    get :show, id: @schedule_p1
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @schedule_p1
    assert_response :success
  end

  test "should update schedule_p1" do
    patch :update, id: @schedule_p1, schedule_p1: { docent_week_id: @schedule_p1.docent_week_id, name: @schedule_p1.name, number: @schedule_p1.number, subject_id: @schedule_p1.subject_id, turn_type_id: @schedule_p1.turn_type_id }
    assert_redirected_to schedule_p1_path(assigns(:schedule_p1))
  end

  test "should destroy schedule_p1" do
    assert_difference('Schedule::P1.count', -1) do
      delete :destroy, id: @schedule_p1
    end

    assert_redirected_to schedule_p1s_path
  end
end
