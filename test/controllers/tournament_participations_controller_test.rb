require 'test_helper'

class TournamentParticipationsControllerTest < ActionController::TestCase
  setup do
    @tournament_participation = tournament_participations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tournament_participations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tournament_participation" do
    assert_difference('TournamentParticipation.count') do
      post :create, tournament_participation: { character_id: @tournament_participation.character_id, tournament_id: @tournament_participation.tournament_id }
    end

    assert_redirected_to tournament_participation_path(assigns(:tournament_participation))
  end

  test "should show tournament_participation" do
    get :show, id: @tournament_participation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tournament_participation
    assert_response :success
  end

  test "should update tournament_participation" do
    patch :update, id: @tournament_participation, tournament_participation: { character_id: @tournament_participation.character_id, tournament_id: @tournament_participation.tournament_id }
    assert_redirected_to tournament_participation_path(assigns(:tournament_participation))
  end

  test "should destroy tournament_participation" do
    assert_difference('TournamentParticipation.count', -1) do
      delete :destroy, id: @tournament_participation
    end

    assert_redirected_to tournament_participations_path
  end
end
