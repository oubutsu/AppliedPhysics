class PagesController < ApplicationController
  def index
  	@reports = []
  	@tests = []
  	for i in 0..6 do
  		@events += Event.where(deadline: Date.today+i)
  	end

    @events.each do |event|
      if event.event_type == 'レポート'
        @reports+= event     
      elsif event.event_type == '小テスト'
        @tests+= event
      else
        @others+= event
      end 


  	# @tests = 'huga'
  	# @samashi = 'samashi'
  end
end
