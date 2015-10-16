class Team < ActiveRecord::Base
  has_many :fixtures
  def fixtures
    Fixture.where("home_team_id = ? OR away_team_id = ?", id, id)
  end
end
