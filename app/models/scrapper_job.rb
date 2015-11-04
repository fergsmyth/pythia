class ScrapperJob < ActiveRecord::Base
	require 'json'
	require 'open-uri'

	has_many :fixtures
	has_many :players
	has_many :player_fixture_performances

	def scrape_ff

		first_run = PlayerFixturePerformance.count.zero? #used to import all historical or not
		team_fixture_array = Array.new #used to limit teh amount of updating of future fixtures
		# file = File.read(Dir.pwd+"/scriplets/sample html/player.json")
	  for player_element_id in 0..700 do
		begin
			data_hash = JSON.load(open('http://fantasy.premierleague.com/web/api/elements/'+player_element_id.to_s))
			
			player = Player.find_or_create_by(ff_id: data_hash['id'])
			player.scrapper_job_id = self.id
			player.populate data_hash 
			player.save

			events_array = data_hash['fixture_history']['all']
			events_array.each do |event| 
				if first_run || DateTime.parse(event[0]) + 2 > DateTime.now
					opp_team = Team.find_by(short_name: event[2][0..2])
				  if opp_team.nil?
				    p event[2][0..2]
				  end
				  if event[2][4] == 'H'
				    fixture = Fixture.find_by(home_team: player.team, away_team: opp_team)
				  else
				    fixture = Fixture.find_by(home_team: opp_team, away_team: player.team)
				  end
				  fixture.kickoff = event[0]
				  fixture.gameweek_id = event[1]
				  fixture.save

				  # This will need to be changed to take into account a player changing team
				  player_fixture_performance = PlayerFixturePerformance.find_or_create_by(player: player, fixture: fixture)
				  player_fixture_performance.populate event
				  player_fixture_performance.scrapper_job_id = self.id
				  player_fixture_performance.save
				end
			end

			if team_fixture_array.include? player.team
				team_fixture_array.push(player.team)
				fixtures_array = data_hash['fixtures']['all']
				fixtures_array.each do |fixture_element|
				  opp_team = Team.find_by(name: fixture_element[2][0...-4])
				  if fixture_element[2][-2,1] == 'H'
				    fixture = Fixture.find_by(home_team: player.team, away_team: opp_team)
				  else
				    fixture = Fixture.find_by(home_team: opp_team, away_team: player.team)
				  end
				  fixture.kickoff = fixture_element[0]
				  fixture.gameweek_id = fixture_element[1][-2,2]
				  fixture.save
				end
			end
		rescue Exception => ex
			p '404'
		end
	  end
	end	
end
