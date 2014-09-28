require 'test_helper'

class IncludesControllerTest < ActionController::TestCase
  setup do
    @include = includes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:includes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create include" do
    assert_difference('Include.count') do
      post :create, include: { description: @include.description, tour_id: @include.tour_id }
    end

    assert_redirected_to include_path(assigns(:include))
  end

  test "should show include" do
    get :show, id: @include
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @include
    assert_response :success
  end

  test "should update include" do
    patch :update, id: @include, include: { description: @include.description, tour_id: @include.tour_id }
    assert_redirected_to include_path(assigns(:include))
  end

  test "should destroy include" do
    assert_difference('Include.count', -1) do
      delete :destroy, id: @include
    end

    assert_redirected_to includes_path
  end
end
