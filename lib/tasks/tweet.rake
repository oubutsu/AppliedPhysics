namespace :twiiter do
	require './lib/utils/twitter'

	desc "tweet events"
	task :tweetevent => :environment do
		bot =  Bot.new
		reports = Event.where(deadline: Date.today+1)
		templete = '明日の課題は'
		reports.each do |report|
			templete = "#{templete}\n・" + report.name
		end

		bot.client.update(templete)
	end
end
