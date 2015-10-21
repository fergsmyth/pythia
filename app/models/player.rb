class Player < ActiveRecord::Base
	belongs_to :team
	has_many :player_fixture_performances
end
