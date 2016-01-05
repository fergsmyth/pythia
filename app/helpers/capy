require 'capybara'
require 'capybara/poltergeist'
require 'pry'
include Capybara::DSL

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, {js_errors: false})
end
Capybara.default_driver = :poltergeist

visit ('http://www.whoscored.com/')

first('#popular-tournaments-list a').click
all_links = []
# Gets all links from the 
loop do
  links = page.all(:css, 'table#tournament-fixture td.result a.result-1')
  links.each { |link| 	p link["href"]
	       all_links.push(link["href"])
  }
  p page.first(:css, 'div#date-controller a#date-config-toggle-button span').text
  previous = page.find(".previous")
  break if previous[:class].include?("is-disabled")
  previous.click
  sleep 3
end

all_links.each  {|link|  visit(link) 
		 sleep 10
		 # Retrieve div containing home team info
		 team_info = page.all(:css, '.team-info')
		 p team_info.first.find('.team-name').text
		 p team_info.first.find('.formation').text
		 p team_info.last.find('.team-name').text
                 p team_info.last.find('.formation').text
}
