json.array!(@fixtures) do |fixture|
  json.extract! fixture, :id, :home_team_id, :away_team_id, :gameweek_id, :kickoff
  json.url fixture_url(fixture, format: :json)
end
