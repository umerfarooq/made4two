require 'test_helper'

class WeLovesControllerTest < ActionController::TestCase
  setup do
    @we_love = we_loves(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:we_loves)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create we_love" do
    assert_difference('WeLofe.count') do
      post :create, we_love: { description: @we_love.description, tour_id: @we_love.tour_id }
    end

    assert_redirected_to we_love_path(assigns(:we_love))
  end

  test "should show we_love" do
    get :show, id: @we_love
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @we_love
    assert_response :success
  end

  test "should update we_love" do
    patch :update, id: @we_love, we_love: { description: @we_love.description, tour_id: @we_love.tour_id }
    assert_redirected_to we_love_path(assigns(:we_love))
  end

  test "should destroy we_love" do
    assert_difference('WeLofe.count', -1) do
      delete :destroy, id: @we_love
    end

    assert_redirected_to we_loves_path
  end
end
