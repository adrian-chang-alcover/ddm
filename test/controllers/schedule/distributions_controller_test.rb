require 'test_helper'

class Schedule::DistributionsControllerTest < ActionController::TestCase
  setup do
    @schedule_distribution = schedule_distributions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:schedule_distributions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create schedule_distribution" do
    assert_difference('Schedule::Distribution.count') do
      post :create, schedule_distribution: { group_id: @schedule_distribution.group_id, professor_id: @schedule_distribution.professor_id, subject_id: @schedule_distribution.subject_id }
    end

    assert_redirected_to schedule_distribution_path(assigns(:schedule_distribution))
  end

  test "should show schedule_distribution" do
    get :show, id: @schedule_distribution
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @schedule_distribution
    assert_response :success
  end

  test "should update schedule_distribution" do
    patch :update, id: @schedule_distribution, schedule_distribution: { group_id: @schedule_distribution.group_id, professor_id: @schedule_distribution.professor_id, subject_id: @schedule_distribution.subject_id }
    assert_redirected_to schedule_distribution_path(assigns(:schedule_distribution))
  end

  test "should destroy schedule_distribution" do
    assert_difference('Schedule::Distribution.count', -1) do
      delete :destroy, id: @schedule_distribution
    end

    assert_redirected_to schedule_distributions_path
  end
end
