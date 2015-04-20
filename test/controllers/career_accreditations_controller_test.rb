require 'test_helper'

class CareerAccreditationsControllerTest < ActionController::TestCase
  setup do
    @career_accreditation = career_accreditations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:career_accreditations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create career_accreditation" do
    assert_difference('CareerAccreditation.count') do
      post :create, career_accreditation: { accreditation_category_id: @career_accreditation.accreditation_category_id, career_id: @career_accreditation.career_id, comments: @career_accreditation.comments, university_id: @career_accreditation.university_id, year: @career_accreditation.year }
    end

    assert_redirected_to career_accreditation_path(assigns(:career_accreditation))
  end

  test "should show career_accreditation" do
    get :show, id: @career_accreditation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @career_accreditation
    assert_response :success
  end

  test "should update career_accreditation" do
    patch :update, id: @career_accreditation, career_accreditation: { accreditation_category_id: @career_accreditation.accreditation_category_id, career_id: @career_accreditation.career_id, comments: @career_accreditation.comments, university_id: @career_accreditation.university_id, year: @career_accreditation.year }
    assert_redirected_to career_accreditation_path(assigns(:career_accreditation))
  end

  test "should destroy career_accreditation" do
    assert_difference('CareerAccreditation.count', -1) do
      delete :destroy, id: @career_accreditation
    end

    assert_redirected_to career_accreditations_path
  end
end
