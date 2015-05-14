require 'test_helper'

class Schedule::ProfessorsControllerTest < ActionController::TestCase
  setup do
    @schedule_professor = schedule_professors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:schedule_professors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create schedule_professor" do
    assert_difference('Schedule::Professor.count') do
      post :create, schedule_professor: { docent_category_id: @schedule_professor.docent_category_id, email: @schedule_professor.email, faculty_id: @schedule_professor.faculty_id, name: @schedule_professor.name, scientific_degree_id: @schedule_professor.scientific_degree_id }
    end

    assert_redirected_to schedule_professor_path(assigns(:schedule_professor))
  end

  test "should show schedule_professor" do
    get :show, id: @schedule_professor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @schedule_professor
    assert_response :success
  end

  test "should update schedule_professor" do
    patch :update, id: @schedule_professor, schedule_professor: { docent_category_id: @schedule_professor.docent_category_id, email: @schedule_professor.email, faculty_id: @schedule_professor.faculty_id, name: @schedule_professor.name, scientific_degree_id: @schedule_professor.scientific_degree_id }
    assert_redirected_to schedule_professor_path(assigns(:schedule_professor))
  end

  test "should destroy schedule_professor" do
    assert_difference('Schedule::Professor.count', -1) do
      delete :destroy, id: @schedule_professor
    end

    assert_redirected_to schedule_professors_path
  end
end
