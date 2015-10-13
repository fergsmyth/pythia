json.array!(@teams) do |team|
  json.extract! team, :id, :code, :external_id, :short_name, :name, :string
  json.url team_url(team, format: :json)
end
