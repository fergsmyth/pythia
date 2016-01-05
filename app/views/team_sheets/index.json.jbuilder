json.array!(@team_sheets) do |team_sheet|
  json.extract! team_sheet, :id, :name
  json.url team_sheet_url(team_sheet, format: :json)
end
