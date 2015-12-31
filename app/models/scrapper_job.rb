class ScrapperJob < ActiveRecord::Base
  require 'json'
  require 'open-uri'
  require 'capybara/poltergeist'
  include Capybara::DSL

  has_many :fixtures
  has_many :players
  has_many :player_fixture_performances

  def scrape_results

    Capybara.register_driver :poltergeist do |app|
      Capybara::Poltergeist::Driver.new(app, {js_errors: false})
    end
    Capybara.default_driver = :poltergeist

    visit ('http://www.whoscored.com/')
    first('#popular-tournaments-list a').click
    all_links = []
    # Gets all links from the 
    loop do
      links = page.all(:css, 'table#tournament-fixture td.result a.result-1')
      links.each { |link| 	
	p link["href"]
	p link.text
	fixtureLink = FixtureLink.new(link["href"], link.text)
	all_links.push(fixtureLink)
      }
      p page.first(:css, 'div#date-controller a#date-config-toggle-button span').text
      previous = page.find(".previous")
      break if previous[:class].include?("is-disabled")
      previous.click
      sleep 10
    end

    all_links.each  {|fixtureLink|  visit(fixtureLink.link) 
		     sleep 10
		     # Retrieve div containing home team info
		     team_info = page.all(:css, '.team-info')
		     home_team_name = team_info.first.find('.team-name').text
		     home_formation = team_info.first.find('.formation').text
		     away_team_name = team_info.last.find('.team-name').text
		     away_formation = team_info.last.find('.formation').text
		     unique_name = home_team_name + " VS " + away_team_name
		     fixture = Fixture.find_by(unique_name: unique_name)
		     fixture.result = fixtureLink.result
		     fixture.home_team.formation = home_formation
		     fixture.away_team.formation = away_formation
		     Fixture.transaction do
		       fixture.home_team.save
		       fixture.away_team.save
		       fixture.save
		     end
    }
  end

  def scrape_ff

    first_run = PlayerFixturePerformance.count.zero? #used to import all historical or not
    team_fixture_array = Array.new #used to limit teh amount of updating of future fixtures
    # file = File.read(Dir.pwd+"/scriplets/sample html/player.json")
    for player_element_id in 0..700 do
      begin
	data_hash = JSON.load(open('http://fantasy.premierleague.com/web/api/elements/'+player_element_id.to_s))
	# "07 Nov 15:00"
	player = Player.find_or_create_by(ff_id: data_hash['id'])
	player.scrapper_job_id = self.id
	player.populate data_hash 
	player.save

	events_array = data_hash['fixture_history']['all']
	events_array.each do |event| 
	  if first_run || DateTime.strptime(event[0],'%d %b %H:%M') + 2 > DateTime.now
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

class FixtureLink < Struct.new(:link, :result)
end
