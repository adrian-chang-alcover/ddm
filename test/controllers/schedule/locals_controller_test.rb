require 'test_helper'

class Schedule::LocalsControllerTest < ActionController::TestCase
  setup do
    @schedule_local = schedule_locals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:schedule_locals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create schedule_local" do
    assert_difference('Schedule::Local.count') do
      post :create, schedule_local: { capacity: @schedule_local.capacity, faculty_id: @schedule_local.faculty_id, name: @schedule_local.name }
    end

    assert_redirected_to schedule_local_path(assigns(:schedule_local))
  end

  test "should show schedule_local" do
    get :show, id: @schedule_local
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @schedule_local
    assert_response :success
  end

  test "should update schedule_local" do
    patch :update, id: @schedule_local, schedule_local: { capacity: @schedule_local.capacity, faculty_id: @schedule_local.faculty_id, name: @schedule_local.name }
    assert_redirected_to schedule_local_path(assigns(:schedule_local))
  end

  test "should destroy schedule_local" do
    assert_difference('Schedule::Local.count', -1) do
      delete :destroy, id: @schedule_local
    end

    assert_redirected_to schedule_locals_path
  end
end
