require 'test_helper'

class Schedule::TurnsControllerTest < ActionController::TestCase
  setup do
    @schedule_turn = schedule_turns(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:schedule_turns)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create schedule_turn" do
    assert_difference('Schedule::Turn.count') do
      post :create, schedule_turn: { end_time: @schedule_turn.end_time, name: @schedule_turn.name, start_time: @schedule_turn.start_time }
    end

    assert_redirected_to schedule_turn_path(assigns(:schedule_turn))
  end

  test "should show schedule_turn" do
    get :show, id: @schedule_turn
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @schedule_turn
    assert_response :success
  end

  test "should update schedule_turn" do
    patch :update, id: @schedule_turn, schedule_turn: { end_time: @schedule_turn.end_time, name: @schedule_turn.name, start_time: @schedule_turn.start_time }
    assert_redirected_to schedule_turn_path(assigns(:schedule_turn))
  end

  test "should destroy schedule_turn" do
    assert_difference('Schedule::Turn.count', -1) do
      delete :destroy, id: @schedule_turn
    end

    assert_redirected_to schedule_turns_path
  end
end
