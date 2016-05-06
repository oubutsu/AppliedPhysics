namespace :twiiter do
	require './lib/utils/twitter'

	desc "tweet events"
	task :tweetevent => :environment do
		bot =  Bot.new
		reports = []
		for i in 0..3 do
  		reports += Event.where(deadline: Date.today+i)
  		end
		case Time.now.hour
			when 0 then
				templete = "< 朝のお知らせ >\n本日から三日間の予定は"
			when 4 then
				templete = "< お昼のお知らせ >\n本日から三日間の予定は"
			when 9 then
				templete = "< 夕方のお知らせ >\n本日から三日間の予定は"
			when 12 then
				templete = "< 夜のお知らせ >\n本日から三日間の予定は"
		end
		if reports.present?
			reports.each do |report|
				templete = "#{templete}\n・" + report.name + " : " + report.deadline.month.to_s + "月" + report.deadline.day.to_s + "日まで"
			end
		else
			templete = "#{templete}ありません\n https://appliedphysics.herokuapp.com/"
		end
		begin
		  bot.client.update(templete)
		rescue
		  templete = "課題が多すぎて140字に収まりませんでした。\nお手数ですが、サイトにて課題をご確認ください。\n https://appliedphysics.herokuapp.com/"
		  bot.client.update(templete)
		end
	end
end
