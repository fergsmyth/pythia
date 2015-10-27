class Fixture < ActiveRecord::Base

	belongs_to :home_team, class_name: "Team",
						foreign_key: "home_team_id"
	belongs_to :away_team, class_name: "Team",
						foreign_key: "away_team_id"
	belongs_to :gameweek
	has_many :player_fixture_performances
	belongs_to :scrapper_job
end
