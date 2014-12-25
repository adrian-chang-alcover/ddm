require 'test_helper'

class SubjectsControllerTest < ActionController::TestCase
  setup do
    @subject = subjects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subjects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subject" do
    assert_difference('Subject.count') do
      post :create, subject: { descipline_id: @subject.descipline_id, evaluation_type_id: @subject.evaluation_type_id, full_name: @subject.full_name, hours: @subject.hours, semester_id: @subject.semester_id, short_name: @subject.short_name }
    end

    assert_redirected_to subject_path(assigns(:subject))
  end

  test "should show subject" do
    get :show, id: @subject
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subject
    assert_response :success
  end

  test "should update subject" do
    patch :update, id: @subject, subject: { descipline_id: @subject.descipline_id, evaluation_type_id: @subject.evaluation_type_id, full_name: @subject.full_name, hours: @subject.hours, semester_id: @subject.semester_id, short_name: @subject.short_name }
    assert_redirected_to subject_path(assigns(:subject))
  end

  test "should destroy subject" do
    assert_difference('Subject.count', -1) do
      delete :destroy, id: @subject
    end

    assert_redirected_to subjects_path
  end
end
