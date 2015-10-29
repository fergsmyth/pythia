class PlayerFixturePerformance < ActiveRecord::Base
  belongs_to :player
  belongs_to :fixture
  belongs_to :scrapper_job

  def populate(event)
  	self.kickoff = event[0] # Should be moved to corresponding fixture
  	self.minutes_player = event[3]
	self.goals_scored = event[4]
	self.assists = event[5]
	self.clean_sheets = event[6]
	self.goals_conceded = event[7]
	self.own_goals = event[8]
	self.penalties_saved = event[9]
	self.penalties_missed = event[10]
	self.yellow_cards = event[11]
	self.red_cards = event[12]
	self.saves = event[13]
	self.bonus_points = event[14]
	self.esp = event[15]
	self.bps = event[16]
	self.net_transfers = event[17]
	self.value = event[18]
	self.point = event[19]
  end
end
