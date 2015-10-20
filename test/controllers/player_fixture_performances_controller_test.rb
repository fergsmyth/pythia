require 'test_helper'

class PlayerFixturePerformancesControllerTest < ActionController::TestCase
  setup do
    @player_fixture_performance = player_fixture_performances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:player_fixture_performances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create player_fixture_performance" do
    assert_difference('PlayerFixturePerformance.count') do
      post :create, player_fixture_performance: { assists: @player_fixture_performance.assists, bonus_points: @player_fixture_performance.bonus_points, bps: @player_fixture_performance.bps, clean_sheets: @player_fixture_performance.clean_sheets, esp: @player_fixture_performance.esp, fixture_id: @player_fixture_performance.fixture_id, goals_conceded: @player_fixture_performance.goals_conceded, goals_scored: @player_fixture_performance.goals_scored, kickoff: @player_fixture_performance.kickoff, minutes_player: @player_fixture_performance.minutes_player, net_transfers: @player_fixture_performance.net_transfers, own_goals: @player_fixture_performance.own_goals, penalties_missed: @player_fixture_performance.penalties_missed, penalties_saved: @player_fixture_performance.penalties_saved, player_id: @player_fixture_performance.player_id, point: @player_fixture_performance.point, red_cards: @player_fixture_performance.red_cards, saves: @player_fixture_performance.saves, value: @player_fixture_performance.value, yellow_cards: @player_fixture_performance.yellow_cards }
    end

    assert_redirected_to player_fixture_performance_path(assigns(:player_fixture_performance))
  end

  test "should show player_fixture_performance" do
    get :show, id: @player_fixture_performance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @player_fixture_performance
    assert_response :success
  end

  test "should update player_fixture_performance" do
    patch :update, id: @player_fixture_performance, player_fixture_performance: { assists: @player_fixture_performance.assists, bonus_points: @player_fixture_performance.bonus_points, bps: @player_fixture_performance.bps, clean_sheets: @player_fixture_performance.clean_sheets, esp: @player_fixture_performance.esp, fixture_id: @player_fixture_performance.fixture_id, goals_conceded: @player_fixture_performance.goals_conceded, goals_scored: @player_fixture_performance.goals_scored, kickoff: @player_fixture_performance.kickoff, minutes_player: @player_fixture_performance.minutes_player, net_transfers: @player_fixture_performance.net_transfers, own_goals: @player_fixture_performance.own_goals, penalties_missed: @player_fixture_performance.penalties_missed, penalties_saved: @player_fixture_performance.penalties_saved, player_id: @player_fixture_performance.player_id, point: @player_fixture_performance.point, red_cards: @player_fixture_performance.red_cards, saves: @player_fixture_performance.saves, value: @player_fixture_performance.value, yellow_cards: @player_fixture_performance.yellow_cards }
    assert_redirected_to player_fixture_performance_path(assigns(:player_fixture_performance))
  end

  test "should destroy player_fixture_performance" do
    assert_difference('PlayerFixturePerformance.count', -1) do
      delete :destroy, id: @player_fixture_performance
    end

    assert_redirected_to player_fixture_performances_path
  end
end
