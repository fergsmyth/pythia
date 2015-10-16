json.array!(@gameweek_events) do |gameweek_event|
  json.extract! gameweek_event, :id, :fixture_id, :player_id, :kickoff, :minutes_player, :goals_scored, :assists, :clean_sheets, :goals_conceded, :own_goals, :penalties_saved, :penalties_missed, :yellow_cards, :red_cards, :saves, :bonus_points, :esp, :bps, :net_transfers, :value, :point
  json.url gameweek_event_url(gameweek_event, format: :json)
end
