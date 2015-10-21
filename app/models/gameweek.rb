class Gameweek < ActiveRecord::Base
	has_many :fixtures
	belongs_to :scrapper_job
end
