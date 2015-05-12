require 'test_helper'

class Schedule::DocentDaysControllerTest < ActionController::TestCase
  setup do
    @schedule_docent_day = schedule_docent_days(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:schedule_docent_days)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create schedule_docent_day" do
    assert_difference('Schedule::DocentDay.count') do
      post :create, schedule_docent_day: { day: @schedule_docent_day.day, docent_week_id: @schedule_docent_day.docent_week_id }
    end

    assert_redirected_to schedule_docent_day_path(assigns(:schedule_docent_day))
  end

  test "should show schedule_docent_day" do
    get :show, id: @schedule_docent_day
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @schedule_docent_day
    assert_response :success
  end

  test "should update schedule_docent_day" do
    patch :update, id: @schedule_docent_day, schedule_docent_day: { day: @schedule_docent_day.day, docent_week_id: @schedule_docent_day.docent_week_id }
    assert_redirected_to schedule_docent_day_path(assigns(:schedule_docent_day))
  end

  test "should destroy schedule_docent_day" do
    assert_difference('Schedule::DocentDay.count', -1) do
      delete :destroy, id: @schedule_docent_day
    end

    assert_redirected_to schedule_docent_days_path
  end
end
