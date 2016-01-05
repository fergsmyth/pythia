require 'test_helper'

class PlayersControllerTest < ActionController::TestCase
  setup do
    @player = players(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:players)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create player" do
    assert_difference('Player.count') do
      post :create, player: { chance_of_playing_next_round: @player.chance_of_playing_next_round, chance_of_playing_this_round: @player.chance_of_playing_this_round, code: @player.code, cost_change_start: @player.cost_change_start, cost_change_start_fall: @player.cost_change_start_fall, display_name: @player.display_name, dreamteam_count: @player.dreamteam_count, ep_next: @player.ep_next, ep_this: @player.ep_this, ff_id: @player.ff_id, first_name: @player.first_name, form: @player.form, in_dreamteam: @player.in_dreamteam, loaned_in: @player.loaned_in, loaned_out: @player.loaned_out, loans_in: @player.loans_in, loans_out: @player.loans_out, news: @player.news, now_cost: @player.now_cost, points_per_game: @player.points_per_game, position: @player.position, second_name: @player.second_name, selected_by: @player.selected_by, selected_by_percent: @player.selected_by_percent, special: @player.special, status: @player.status, team_code: @player.team_code, team_id: @player.team_id, total_points: @player.total_points, transfers_in: @player.transfers_in, transfers_out: @player.transfers_out, value_form: @player.value_form, value_season: @player.value_season }
    end

    assert_redirected_to player_path(assigns(:player))
  end

  test "should show player" do
    get :show, id: @player
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @player
    assert_response :success
  end

  test "should update player" do
    patch :update, id: @player, player: { chance_of_playing_next_round: @player.chance_of_playing_next_round, chance_of_playing_this_round: @player.chance_of_playing_this_round, code: @player.code, cost_change_start: @player.cost_change_start, cost_change_start_fall: @player.cost_change_start_fall, display_name: @player.display_name, dreamteam_count: @player.dreamteam_count, ep_next: @player.ep_next, ep_this: @player.ep_this, ff_id: @player.ff_id, first_name: @player.first_name, form: @player.form, in_dreamteam: @player.in_dreamteam, loaned_in: @player.loaned_in, loaned_out: @player.loaned_out, loans_in: @player.loans_in, loans_out: @player.loans_out, news: @player.news, now_cost: @player.now_cost, points_per_game: @player.points_per_game, position: @player.position, second_name: @player.second_name, selected_by: @player.selected_by, selected_by_percent: @player.selected_by_percent, special: @player.special, status: @player.status, team_code: @player.team_code, team_id: @player.team_id, total_points: @player.total_points, transfers_in: @player.transfers_in, transfers_out: @player.transfers_out, value_form: @player.value_form, value_season: @player.value_season }
    assert_redirected_to player_path(assigns(:player))
  end

  test "should destroy player" do
    assert_difference('Player.count', -1) do
      delete :destroy, id: @player
    end

    assert_redirected_to players_path
  end
end
