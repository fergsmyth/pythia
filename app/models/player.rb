class Player < ActiveRecord::Base
	belongs_to :team
	belongs_to :scrapper_job
	has_many :player_fixture_performances
end
