require 'test_helper'

class DynamicNewsControllerTest < ActionController::TestCase
  setup do
    @dynamic_news = dynamic_news(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dynamic_news)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dynamic_news" do
    assert_difference('DynamicNew.count') do
      post :create, dynamic_news: { description: @dynamic_news.description, title: @dynamic_news.title }
    end

    assert_redirected_to dynamic_news_path(assigns(:dynamic_news))
  end

  test "should show dynamic_news" do
    get :show, id: @dynamic_news
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dynamic_news
    assert_response :success
  end

  test "should update dynamic_news" do
    patch :update, id: @dynamic_news, dynamic_news: { description: @dynamic_news.description, title: @dynamic_news.title }
    assert_redirected_to dynamic_news_path(assigns(:dynamic_news))
  end

  test "should destroy dynamic_news" do
    assert_difference('DynamicNew.count', -1) do
      delete :destroy, id: @dynamic_news
    end

    assert_redirected_to dynamic_news_path
  end
end
