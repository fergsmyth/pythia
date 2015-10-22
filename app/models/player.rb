class Player < ActiveRecord::Base
	belongs_to :team
	belongs_to :scrapper_job
	has_many :player_fixture_performances

	def populate(data_hash)
	    self.display_name =  data_hash['web_name']# display_name
	    self.position = data_hash['type_name']# position
	    self.selected_by = data_hash['selected_by'].to_f# selected_by STring to float
	    self.total_points =  data_hash['total_points']# total_points
	    self.team_code = data_hash['team_code']# team_code use to find actual team? Maybe doesnt need to be persisted?
	    self.team = Team.find_by code: self.team_code
	    self.news = data_hash['news']# news
	    self.status = data_hash['status']# status
	    self.code = data_hash['code']# code
	    self.first_name = data_hash['first_name']# first_name
	    self.second_name = data_hash['second_name']# second_name
	    self.now_cost = data_hash['now_cost'] * 0.1 # now_cost
	    self.chance_of_playing_this_round = data_hash['chance_of_playing_this_round']# newchance_of_playing_this_rounds
	    self.chance_of_playing_next_round = data_hash['chance_of_playing_next_round']# chance_of_playing_next_round can be null
	    self.value_form = data_hash['value_form'].to_f # value_form STRING
	    self.value_season = data_hash['value_season'].to_f # value_season STRING
	    self.cost_change_start = data_hash['cost_change_start'] * 0.1 # cost_change_start
	    self.cost_change_start_fall = data_hash['cost_change_start_fall'] * 0.1  # cost_change_start_fall
	    self.in_dreamteam = data_hash['in_dreamteam']# in_dreamteam
	    self.dreamteam_count = data_hash['dreamteam_count']# dreamteam_count
	    self.selected_by_percent = data_hash['selected_by_percent'].to_f # selected_by_percent STRING
	    self.form = data_hash['form'].to_f # form STRING
	    self.transfers_out = data_hash['transfers_out']# transfers_out
	    self.transfers_in = data_hash['transfers_in']# transfers_in
	    self.loans_in = data_hash['loans_in']# loans_in
	    self.loans_out = data_hash['loans_out']# loans_out
	    self.loaned_in = data_hash['loaned_in']# loaned_in
	    self.loaned_out = data_hash['loaned_out']# loaned_out
	    self.points_per_game = data_hash['points_per_game'].to_f# points_per_game STRING
	    self.ep_this = data_hash['ep_this'].to_f # ep_this STRING
	    self.ep_next = data_hash['ep_next'].to_f # ep_next STRING
	    self.special = data_hash['special']# special (boolean)

	end

end
