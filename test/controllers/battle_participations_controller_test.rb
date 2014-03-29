require 'test_helper'

class BattleParticipationsControllerTest < ActionController::TestCase
  setup do
    @battle_participation = battle_participations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:battle_participations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create battle_participation" do
    assert_difference('BattleParticipation.count') do
      post :create, battle_participation: { battle_id: @battle_participation.battle_id, character_id: @battle_participation.character_id, status: @battle_participation.status }
    end

    assert_redirected_to battle_participation_path(assigns(:battle_participation))
  end

  test "should show battle_participation" do
    get :show, id: @battle_participation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @battle_participation
    assert_response :success
  end

  test "should update battle_participation" do
    patch :update, id: @battle_participation, battle_participation: { battle_id: @battle_participation.battle_id, character_id: @battle_participation.character_id, status: @battle_participation.status }
    assert_redirected_to battle_participation_path(assigns(:battle_participation))
  end

  test "should destroy battle_participation" do
    assert_difference('BattleParticipation.count', -1) do
      delete :destroy, id: @battle_participation
    end

    assert_redirected_to battle_participations_path
  end
end
