# \http://fantasy.premierleague.com/web/api/elements/445/

require 'nokogiri'

require 'json'

file = File.read(Dir.pwd+"/scriplets/sample html/player.json")

data_hash = JSON.parse(file)

key_hash = data_hash.keys

# p key_hash
p data_hash['id']# ff_id
p data_hash['web_name']# display_name
p data_hash['type_name']# position
p data_hash['selected_by']# selected_by STRING to float
p data_hash['total_points']# total_points
p data_hash['team_code']# team_code use to find actual team? Maybe doesnt need to be persisted?
p data_hash['news']# news
p data_hash['status']# status
p data_hash['code']# code
p data_hash['first_name']# first_name
p data_hash['second_name']# second_name
p data_hash['now_cost']# now_cost
p data_hash['chance_of_playing_this_round']# newchance_of_playing_this_rounds
p data_hash['chance_of_playing_next_round']# chance_of_playing_next_round can be null
p data_hash['value_form']# value_form STRING
p data_hash['value_season']# value_season STRING
p data_hash['cost_change_start']# cost_change_start
p data_hash['cost_change_start_fall']# cost_change_start_fall
p data_hash['in_dreamteam']# in_dreamteam
p data_hash['dreamteam_count']# dreamteam_count
p data_hash['selected_by_percent']# selected_by_percent STRING
p data_hash['form']# form STRING
p data_hash['transfers_out']# transfers_out
p data_hash['transfers_in']# transfers_in
p data_hash['loans_in']# loans_in
p data_hash['loans_out']# loans_out
p data_hash['loaned_in']# loaned_in
p data_hash['loaned_in']# loaned_out
p data_hash['points_per_game']# points_per_game STRING
p data_hash['ep_this']# ep_this STRING
p data_hash['ep_next']# ep_next STRING
p data_hash['special']# special (boolean)

 # key_hash.each do |key|
 # 	p key
 # end

#p data_hash['elInfo']

# Order
# 1. player
# 2. team
# 3. fixtures
# 4. gameweek events/gameweeks

# "byetext"						= "-"
# "currency"					= "£"
# "dataView"					= Data View (transfers page) column names
# "eiwteams" 					= json of teams, their names and short names
# "elements"					= team in elInfo ids of logged in person, could also be whichever team is active
# "elementWrap"					= 0
# "elHideCurrencyQuantifier"	= true
# "elHideCurrencySymbol"		= true
# "elInfo" 						= array of all players
# "elStat"						= json of something? Its not a player or the aggregate of the team...
# "errAllSelected"				= error message
# "errAlreadyChosen"			= error message
# "errTeam"						= error message
# "iconDir"						= icon directory
# "iconExt"						= icon extension
# "maxTypes"					= json of max of each position (eg 2 for goalie)
# "minMax"						= json of min and max values for somethings
# "mode"						= "transfers"
# "numTypes"					= 4
# "picks"						= json of price values for players on team (sell, paid etc)
# "pitchStat"					= "selling_price"
# "selectionPlayerLimit"		= 30
# "selectionPriceGap"			= 5
# "shirtDir"					= shirt directory
# "shirtExt"					= shirt extension
# "shortTeamNames"				= true
# "squadSize"					= 15
# "teamInfo"					= next game week fixtures
# "teamLimit"					= 3
# "toSpend"						= team money to spend
# "transferCost"				= 4
# "transferCosts"				= 0
# "transfersFree"				= 1
# "transfersMade"				= 1
# "transferState"				= "making"
# "transferType"				= "cost"
# "txtAddElement"				= label
# "txtOutElement"				= label
# "txtPrice"					= label
# "txtValue"					= label
# "txtViewPlayerInfo"			= label
# "typeInfo"					= json of positions
# "watchlist"					= []
