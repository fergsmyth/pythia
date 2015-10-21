class Fixture < ActiveRecord::Base

	belongs_to :hometeam, class_name: "Team",
						foreign_key: "home_team_id"
	belongs_to :awayteam, class_name: "Team",
						foreign_key: "away_team_id"
	belongs_to :gameweek
	has_many :player_fixture_performances
end
