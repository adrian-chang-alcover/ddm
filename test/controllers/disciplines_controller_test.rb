require 'test_helper'

class DisciplinesControllerTest < ActionController::TestCase
  setup do
    @discipline = disciplines(:one)
    login_as_admin
  end

  test "should get index" do
    byebug
    get :index
    assert_response :success
    assert_not_nil assigns(:disciplines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create discipline" do
    assert_difference('Discipline.count') do
      post :create, discipline: { career_id: @discipline.career_id, name: @discipline.name }
    end

    assert_redirected_to discipline_path(assigns(:discipline))
  end

  test "should show discipline" do
    get :show, id: @discipline
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @discipline
    assert_response :success
  end

  test "should update discipline" do
    byebug
    patch :update, id: @discipline, discipline: { career_id: @discipline.career_id, name: @discipline.name }
    assert_redirected_to discipline_path(assigns(:discipline))
  end

  test "should destroy discipline" do
    assert_difference('Discipline.count', -1) do
      delete :destroy, id: @discipline
    end

    assert_redirected_to disciplines_path
  end
end
