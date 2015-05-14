require 'test_helper'

class Schedule::ActivitiesControllerTest < ActionController::TestCase
  setup do
    @schedule_activity = schedule_activities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:schedule_activities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create schedule_activity" do
    assert_difference('Schedule::Activity.count') do
      post :create, schedule_activity: { docent_day_id: @schedule_activity.docent_day_id, group_id: @schedule_activity.group_id, local_id: @schedule_activity.local_id, professor_id: @schedule_activity.professor_id, subject_id: @schedule_activity.subject_id, turn_id: @schedule_activity.turn_id, turn_type_id: @schedule_activity.turn_type_id }
    end

    assert_redirected_to schedule_activity_path(assigns(:schedule_activity))
  end

  test "should show schedule_activity" do
    get :show, id: @schedule_activity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @schedule_activity
    assert_response :success
  end

  test "should update schedule_activity" do
    patch :update, id: @schedule_activity, schedule_activity: { docent_day_id: @schedule_activity.docent_day_id, group_id: @schedule_activity.group_id, local_id: @schedule_activity.local_id, professor_id: @schedule_activity.professor_id, subject_id: @schedule_activity.subject_id, turn_id: @schedule_activity.turn_id, turn_type_id: @schedule_activity.turn_type_id }
    assert_redirected_to schedule_activity_path(assigns(:schedule_activity))
  end

  test "should destroy schedule_activity" do
    assert_difference('Schedule::Activity.count', -1) do
      delete :destroy, id: @schedule_activity
    end

    assert_redirected_to schedule_activities_path
  end
end
