require 'test_helper'

class GetInTouchesControllerTest < ActionController::TestCase
  setup do
    @get_in_touch = get_in_touches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:get_in_touches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create get_in_touch" do
    assert_difference('GetInTouch.count') do
      post :create, get_in_touch: { email: @get_in_touch.email, message: @get_in_touch.message, name: @get_in_touch.name, subject: @get_in_touch.subject }
    end

    assert_redirected_to get_in_touch_path(assigns(:get_in_touch))
  end

  test "should show get_in_touch" do
    get :show, id: @get_in_touch
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @get_in_touch
    assert_response :success
  end

  test "should update get_in_touch" do
    patch :update, id: @get_in_touch, get_in_touch: { email: @get_in_touch.email, message: @get_in_touch.message, name: @get_in_touch.name, subject: @get_in_touch.subject }
    assert_redirected_to get_in_touch_path(assigns(:get_in_touch))
  end

  test "should destroy get_in_touch" do
    assert_difference('GetInTouch.count', -1) do
      delete :destroy, id: @get_in_touch
    end

    assert_redirected_to get_in_touches_path
  end
end
