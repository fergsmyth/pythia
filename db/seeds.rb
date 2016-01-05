# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

file = File.read(Dir.pwd+"/app/assets/static data/teams.json")

data_hash = JSON.parse(file)

key_hash = data_hash.keys

key_hash.each do |key|
  unless (Team.exists?(code: data_hash[key]['code']))
    team = Team.create(code: data_hash[key]['code'], external_id: data_hash[key]['id'], short_name: data_hash[key]['short_name'], name: data_hash[key]['name'])
  end
end


Team.find_each do |home_team|
	Team.where("id != ?", home_team.id).each do |away_team|
		home = TeamSheet.create(name: home_team.name, team: home_team)
		away = TeamSheet.create(name: away_team.name, team: away_team)
		unique_name = home.name + " VS " + away.name
		Fixture.create(home_team: home, away_team: away, unique_name: unique_name)
	end
end

1.upto(38) do |i|
  Gameweek.create(week: i)
end
