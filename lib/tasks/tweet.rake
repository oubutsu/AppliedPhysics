namespace :twiiter do
	require './lib/utils/twitter'

	desc "tweet events"
	task :tweetevent => :environment do
		bot =  Bot.new
		reports = Event.where(deadline: Date.today+1)
		case Time.now.hour
			when 0 then
				templete = "< 朝のお知らせ >\n明日の課題は"
			when 4 then
				templete = "< お昼のお知らせ >\n明日の課題は"
			when 9 then
				templete = "< 夕方のお知らせ >\n明日の課題は"
			when 12 then
				templete = "< 夜のお知らせ >\n明日の課題は"
		end
		if reports.nil?
			reports.each do |report|
				templete = "#{templete}\n・" + report.name
			end
		else
			templete = "#{templete}ありません"
		end

		bot.client.update(templete)
	end
end
