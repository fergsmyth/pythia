class ScrapperJob < ActiveRecord::Base
	has_many :fixtures
	has_many :players
	has_many :okayer_fixture_performances
end
