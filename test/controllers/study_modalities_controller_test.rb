require 'test_helper'

class StudyModalitiesControllerTest < ActionController::TestCase
  setup do
    @study_modality = study_modalities(:one)
    login_as_one
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:study_modalities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create study_modality" do
    assert_difference('StudyModality.count') do
      post :create, study_modality: { full_name: @study_modality.full_name, short_name: @study_modality.short_name }
    end

    assert_redirected_to study_modality_path(assigns(:study_modality))
  end

  test "should show study_modality" do
    get :show, id: @study_modality
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @study_modality
    assert_response :success
  end

  test "should update study_modality" do
    patch :update, id: @study_modality, study_modality: { full_name: @study_modality.full_name, short_name: @study_modality.short_name }
    assert_redirected_to study_modality_path(assigns(:study_modality))
  end

  test "should destroy study_modality" do
    assert_difference('StudyModality.count', -1) do
      delete :destroy, id: @study_modality
    end

    assert_redirected_to study_modalities_path
  end
end
