require 'test_helper'

class StudyPlansControllerTest < ActionController::TestCase
  setup do
    @study_plan = study_plans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:study_plans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create study_plan" do
    assert_difference('StudyPlan.count') do
      post :create, study_plan: { name: @study_plan.name }
    end

    assert_redirected_to study_plan_path(assigns(:study_plan))
  end

  test "should show study_plan" do
    get :show, id: @study_plan
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @study_plan
    assert_response :success
  end

  test "should update study_plan" do
    patch :update, id: @study_plan, study_plan: { name: @study_plan.name }
    assert_redirected_to study_plan_path(assigns(:study_plan))
  end

  test "should destroy study_plan" do
    assert_difference('StudyPlan.count', -1) do
      delete :destroy, id: @study_plan
    end

    assert_redirected_to study_plans_path
  end
end
