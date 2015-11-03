class ScrapperJob < ActiveRecord::Base
	has_many :fixtures
	has_many :players
	has_many :player_fixture_performances
end
