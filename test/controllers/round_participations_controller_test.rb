require 'test_helper'

class RoundParticipationsControllerTest < ActionController::TestCase
  setup do
    @round_participation = round_participations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:round_participations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create round_participation" do
    assert_difference('RoundParticipation.count') do
      post :create, round_participation: { character_id: @round_participation.character_id, late_deduction: @round_participation.late_deduction, point: @round_participation.point, round_id: @round_participation.round_id }
    end

    assert_redirected_to round_participation_path(assigns(:round_participation))
  end

  test "should show round_participation" do
    get :show, id: @round_participation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @round_participation
    assert_response :success
  end

  test "should update round_participation" do
    patch :update, id: @round_participation, round_participation: { character_id: @round_participation.character_id, late_deduction: @round_participation.late_deduction, point: @round_participation.point, round_id: @round_participation.round_id }
    assert_redirected_to round_participation_path(assigns(:round_participation))
  end

  test "should destroy round_participation" do
    assert_difference('RoundParticipation.count', -1) do
      delete :destroy, id: @round_participation
    end

    assert_redirected_to round_participations_path
  end
end
