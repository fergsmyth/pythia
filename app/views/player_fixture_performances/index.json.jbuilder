json.array!(@player_fixture_performances) do |player_fixture_performance|
  json.extract! player_fixture_performance, :id, :fixture_id, :player_id, :kickoff, :minutes_player, :goals_scored, :assists, :clean_sheets, :goals_conceded, :own_goals, :penalties_saved, :penalties_missed, :yellow_cards, :red_cards, :saves, :bonus_points, :esp, :bps, :net_transfers, :value, :point
  json.url player_fixture_performance_url(player_fixture_performance, format: :json)
end
