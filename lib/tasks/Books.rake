require 'open-uri'
require 'nokogiri'
require 'rake'

namespace :db do

	task :seed_fantasy => :environment do
		p = Nokogiri::HTML(open("https://www.oysterbooks.com/explore/category/fantasy"))
		binding.pry
		i = 0
		while p.css('.info>h2>a')[i] != nil
			title = p.css('.info>h2>a')[i].text
			url = p.css('#grid-container div.grid-item div.img-thumbnail')[i]['style'].match(/\'(.+)\'/)
			img_url = url[1]
			open_url = img_url.match(/(.+)\.jpg/)
			Todo.create(name: title, image: open_url[0])
			i += 1
		end
	end

	task :populate_travel_deals => :environment do
		CouponParser.new.populate_travels
	end

	task :slack => :environment do
    a = Slack.client
    list = a.users_list
    list['members'].each do |slack_user|
    User.create(name: slack_user['real_name'],
                first_name: slack_user['profile']['first_name'],
                email: slack_user['profile']['email'],
              user_img_url: slack_user['profile']['image_72'])
    end
  end
end
