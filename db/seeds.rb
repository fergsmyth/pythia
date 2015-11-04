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
		Fixture.create(home_team: home_team, away_team: away_team)
	end
end

