require 'test_helper'

class ImageHeadersControllerTest < ActionController::TestCase
  setup do
    @image_header = image_headers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:image_headers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create image_header" do
    assert_difference('ImageHeader.count') do
      post :create, image_header: { description: @image_header.description, image: @image_header.image, status: @image_header.status }
    end

    assert_redirected_to image_header_path(assigns(:image_header))
  end

  test "should show image_header" do
    get :show, id: @image_header
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @image_header
    assert_response :success
  end

  test "should update image_header" do
    patch :update, id: @image_header, image_header: { description: @image_header.description, image: @image_header.image, status: @image_header.status }
    assert_redirected_to image_header_path(assigns(:image_header))
  end

  test "should destroy image_header" do
    assert_difference('ImageHeader.count', -1) do
      delete :destroy, id: @image_header
    end

    assert_redirected_to image_headers_path
  end
end
