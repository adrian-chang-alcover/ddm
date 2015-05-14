require 'test_helper'

class Schedule::GroupsControllerTest < ActionController::TestCase
  setup do
    @schedule_group = schedule_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:schedule_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create schedule_group" do
    assert_difference('Schedule::Group.count') do
      post :create, schedule_group: { capacity: @schedule_group.capacity, name: @schedule_group.name, year_id: @schedule_group.year_id }
    end

    assert_redirected_to schedule_group_path(assigns(:schedule_group))
  end

  test "should show schedule_group" do
    get :show, id: @schedule_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @schedule_group
    assert_response :success
  end

  test "should update schedule_group" do
    patch :update, id: @schedule_group, schedule_group: { capacity: @schedule_group.capacity, name: @schedule_group.name, year_id: @schedule_group.year_id }
    assert_redirected_to schedule_group_path(assigns(:schedule_group))
  end

  test "should destroy schedule_group" do
    assert_difference('Schedule::Group.count', -1) do
      delete :destroy, id: @schedule_group
    end

    assert_redirected_to schedule_groups_path
  end
end
