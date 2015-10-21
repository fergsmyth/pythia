class PlayerFixturePerformance < ActiveRecord::Base
  belongs_to :player
  belongs_to :fixture
  belongs_to :scrapper_job
end
