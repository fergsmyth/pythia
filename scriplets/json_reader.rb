# \http://fantasy.premierleague.com/web/api/elements/445/

require 'nokogiri'

require 'json'

file = File.read("../app/assets/static data/teams.json")

data_hash = JSON.parse(file)

key_hash = data_hash.keys

#p data_hash["eiwteams"]

 key_hash.each do |key|
 	p data_hash[key]['code']
 	p data_hash[key]['id']
 	p data_hash[key]['short_name']
 	p data_hash[key]['name']
 end

#p data_hash['elInfo']

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
