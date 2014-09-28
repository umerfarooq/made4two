require 'test_helper'

class GalleryToursControllerTest < ActionController::TestCase
  setup do
    @gallery_tour = gallery_tours(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gallery_tours)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gallery_tour" do
    assert_difference('GalleryTour.count') do
      post :create, gallery_tour: { content: @gallery_tour.content, image: @gallery_tour.image, status: @gallery_tour.status, title: @gallery_tour.title, tour_id: @gallery_tour.tour_id }
    end

    assert_redirected_to gallery_tour_path(assigns(:gallery_tour))
  end

  test "should show gallery_tour" do
    get :show, id: @gallery_tour
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gallery_tour
    assert_response :success
  end

  test "should update gallery_tour" do
    patch :update, id: @gallery_tour, gallery_tour: { content: @gallery_tour.content, image: @gallery_tour.image, status: @gallery_tour.status, title: @gallery_tour.title, tour_id: @gallery_tour.tour_id }
    assert_redirected_to gallery_tour_path(assigns(:gallery_tour))
  end

  test "should destroy gallery_tour" do
    assert_difference('GalleryTour.count', -1) do
      delete :destroy, id: @gallery_tour
    end

    assert_redirected_to gallery_tours_path
  end
end
