require 'test_helper'

class Schedule::DocentWeeksControllerTest < ActionController::TestCase
  setup do
    @schedule_docent_week = schedule_docent_weeks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:schedule_docent_weeks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create schedule_docent_week" do
    assert_difference('Schedule::DocentWeek.count') do
      post :create, schedule_docent_week: { first_day: @schedule_docent_week.first_day, number: @schedule_docent_week.number, semester_id: @schedule_docent_week.semester_id, year_id: @schedule_docent_week.year_id }
    end

    assert_redirected_to schedule_docent_week_path(assigns(:schedule_docent_week))
  end

  test "should show schedule_docent_week" do
    get :show, id: @schedule_docent_week
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @schedule_docent_week
    assert_response :success
  end

  test "should update schedule_docent_week" do
    patch :update, id: @schedule_docent_week, schedule_docent_week: { first_day: @schedule_docent_week.first_day, number: @schedule_docent_week.number, semester_id: @schedule_docent_week.semester_id, year_id: @schedule_docent_week.year_id }
    assert_redirected_to schedule_docent_week_path(assigns(:schedule_docent_week))
  end

  test "should destroy schedule_docent_week" do
    assert_difference('Schedule::DocentWeek.count', -1) do
      delete :destroy, id: @schedule_docent_week
    end

    assert_redirected_to schedule_docent_weeks_path
  end
end
