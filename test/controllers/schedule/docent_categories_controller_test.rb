require 'test_helper'

class Schedule::DocentCategoriesControllerTest < ActionController::TestCase
  setup do
    @schedule_docent_category = schedule_docent_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:schedule_docent_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create schedule_docent_category" do
    assert_difference('Schedule::DocentCategory.count') do
      post :create, schedule_docent_category: { full_name: @schedule_docent_category.full_name, short_name: @schedule_docent_category.short_name }
    end

    assert_redirected_to schedule_docent_category_path(assigns(:schedule_docent_category))
  end

  test "should show schedule_docent_category" do
    get :show, id: @schedule_docent_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @schedule_docent_category
    assert_response :success
  end

  test "should update schedule_docent_category" do
    patch :update, id: @schedule_docent_category, schedule_docent_category: { full_name: @schedule_docent_category.full_name, short_name: @schedule_docent_category.short_name }
    assert_redirected_to schedule_docent_category_path(assigns(:schedule_docent_category))
  end

  test "should destroy schedule_docent_category" do
    assert_difference('Schedule::DocentCategory.count', -1) do
      delete :destroy, id: @schedule_docent_category
    end

    assert_redirected_to schedule_docent_categories_path
  end
end
