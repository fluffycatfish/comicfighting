require 'test_helper'

class ProfilePicsControllerTest < ActionController::TestCase
  setup do
    @profile_pic = profile_pics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:profile_pics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create profile_pic" do
    assert_difference('ProfilePic.count') do
      post :create, profile_pic: { avatar: @profile_pic.avatar, user_id: @profile_pic.user_id }
    end

    assert_redirected_to profile_pic_path(assigns(:profile_pic))
  end

  test "should show profile_pic" do
    get :show, id: @profile_pic
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @profile_pic
    assert_response :success
  end

  test "should update profile_pic" do
    patch :update, id: @profile_pic, profile_pic: { avatar: @profile_pic.avatar, user_id: @profile_pic.user_id }
    assert_redirected_to profile_pic_path(assigns(:profile_pic))
  end

  test "should destroy profile_pic" do
    assert_difference('ProfilePic.count', -1) do
      delete :destroy, id: @profile_pic
    end

    assert_redirected_to profile_pics_path
  end
end
