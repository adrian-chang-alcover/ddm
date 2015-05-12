require 'test_helper'

class Schedule::ScientificDegreesControllerTest < ActionController::TestCase
  setup do
    @schedule_scientific_degree = schedule_scientific_degrees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:schedule_scientific_degrees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create schedule_scientific_degree" do
    assert_difference('Schedule::ScientificDegree.count') do
      post :create, schedule_scientific_degree: { full_name: @schedule_scientific_degree.full_name, short_name: @schedule_scientific_degree.short_name }
    end

    assert_redirected_to schedule_scientific_degree_path(assigns(:schedule_scientific_degree))
  end

  test "should show schedule_scientific_degree" do
    get :show, id: @schedule_scientific_degree
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @schedule_scientific_degree
    assert_response :success
  end

  test "should update schedule_scientific_degree" do
    patch :update, id: @schedule_scientific_degree, schedule_scientific_degree: { full_name: @schedule_scientific_degree.full_name, short_name: @schedule_scientific_degree.short_name }
    assert_redirected_to schedule_scientific_degree_path(assigns(:schedule_scientific_degree))
  end

  test "should destroy schedule_scientific_degree" do
    assert_difference('Schedule::ScientificDegree.count', -1) do
      delete :destroy, id: @schedule_scientific_degree
    end

    assert_redirected_to schedule_scientific_degrees_path
  end
end
