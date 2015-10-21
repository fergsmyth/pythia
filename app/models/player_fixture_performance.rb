class PlayerFixturePerformance < ActiveRecord::Base
  belongs_to :player
  belongs_to :fixture
end
