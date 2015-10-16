json.array!(@gameweeks) do |gameweek|
  json.extract! gameweek, :id
  json.url gameweek_url(gameweek, format: :json)
end
