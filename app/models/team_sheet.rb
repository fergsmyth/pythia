class TeamSheet < ActiveRecord::Base
  has_one :fixture
  belongs_to :team
end
