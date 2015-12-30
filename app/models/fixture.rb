class Fixture < ActiveRecord::Base

  	belongs_to :home_team, :foreign_key => "home_team_id",  :class_name => "TeamSheet"
	belongs_to :away_team, :foreign_key => "away_team_id", :class_name => "TeamSheet"

	belongs_to :gameweek
	belongs_to :scrapper_job

	has_many :player_fixture_performances
end
