class PagesController < ApplicationController
  def index
  	@reports = []
  	@tests = []
    @events = []
    @others = []
  	for i in 0..6 do
  		@events += Event.where(deadline: Date.today+i)
  	end

    @events.each do |event|
      if event.event_type == 'レポート'
        @reports.push(event)
      elsif event.event_type == '小テスト'
        @tests.push(event)
      else
        @others.push(event)
      end
    end

  end
end
