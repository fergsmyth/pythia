require 'nokogiri'

require 'json'

file = File.open("sample html/fantasyfootball.html")
page = Nokogiri::HTML(file)

data_hash = JSON.parse(page.css('div#ismJson').css('script').text)

key_hash = data_hash.keys

p data_hash["watchlist"]

# key_hash.each do |key|
# 	p key
# end

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
