require 'test_helper'

class GameweekEventsControllerTest < ActionController::TestCase
  setup do
    @gameweek_event = gameweek_events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gameweek_events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gameweek_event" do
    assert_difference('GameweekEvent.count') do
      post :create, gameweek_event: { assists: @gameweek_event.assists, bonus_points: @gameweek_event.bonus_points, bps: @gameweek_event.bps, clean_sheets: @gameweek_event.clean_sheets, esp: @gameweek_event.esp, fixture_id: @gameweek_event.fixture_id, goals_conceded: @gameweek_event.goals_conceded, goals_scored: @gameweek_event.goals_scored, kickoff: @gameweek_event.kickoff, minutes_player: @gameweek_event.minutes_player, net_transfers: @gameweek_event.net_transfers, own_goals: @gameweek_event.own_goals, penalties_missed: @gameweek_event.penalties_missed, penalties_saved: @gameweek_event.penalties_saved, player_id: @gameweek_event.player_id, point: @gameweek_event.point, red_cards: @gameweek_event.red_cards, saves: @gameweek_event.saves, value: @gameweek_event.value, yellow_cards: @gameweek_event.yellow_cards }
    end

    assert_redirected_to gameweek_event_path(assigns(:gameweek_event))
  end

  test "should show gameweek_event" do
    get :show, id: @gameweek_event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gameweek_event
    assert_response :success
  end

  test "should update gameweek_event" do
    patch :update, id: @gameweek_event, gameweek_event: { assists: @gameweek_event.assists, bonus_points: @gameweek_event.bonus_points, bps: @gameweek_event.bps, clean_sheets: @gameweek_event.clean_sheets, esp: @gameweek_event.esp, fixture_id: @gameweek_event.fixture_id, goals_conceded: @gameweek_event.goals_conceded, goals_scored: @gameweek_event.goals_scored, kickoff: @gameweek_event.kickoff, minutes_player: @gameweek_event.minutes_player, net_transfers: @gameweek_event.net_transfers, own_goals: @gameweek_event.own_goals, penalties_missed: @gameweek_event.penalties_missed, penalties_saved: @gameweek_event.penalties_saved, player_id: @gameweek_event.player_id, point: @gameweek_event.point, red_cards: @gameweek_event.red_cards, saves: @gameweek_event.saves, value: @gameweek_event.value, yellow_cards: @gameweek_event.yellow_cards }
    assert_redirected_to gameweek_event_path(assigns(:gameweek_event))
  end

  test "should destroy gameweek_event" do
    assert_difference('GameweekEvent.count', -1) do
      delete :destroy, id: @gameweek_event
    end

    assert_redirected_to gameweek_events_path
  end
end
