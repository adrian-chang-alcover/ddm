require 'test_helper'

class AccreditationCategoriesControllerTest < ActionController::TestCase
  setup do
    @accreditation_category = accreditation_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:accreditation_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create accreditation_category" do
    assert_difference('AccreditationCategory.count') do
      post :create, accreditation_category: { name: @accreditation_category.name }
    end

    assert_redirected_to accreditation_category_path(assigns(:accreditation_category))
  end

  test "should show accreditation_category" do
    get :show, id: @accreditation_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @accreditation_category
    assert_response :success
  end

  test "should update accreditation_category" do
    patch :update, id: @accreditation_category, accreditation_category: { name: @accreditation_category.name }
    assert_redirected_to accreditation_category_path(assigns(:accreditation_category))
  end

  test "should destroy accreditation_category" do
    assert_difference('AccreditationCategory.count', -1) do
      delete :destroy, id: @accreditation_category
    end

    assert_redirected_to accreditation_categories_path
  end
end
