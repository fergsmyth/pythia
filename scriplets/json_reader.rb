require 'nokogiri'

require 'json'

file = File.open("sample html/fantasyfootball.html")
page = Nokogiri::HTML(file)

data_hash = JSON.parse(page.css('div#ismJson').css('script').text)

p data_hash['elInfo']
# elInfo = array of all players
# eiwteams = json of teams, their names and short names
# teamInfo = next game week fixtures