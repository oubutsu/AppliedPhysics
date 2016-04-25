class PagesController < ApplicationController
  def index
  	@reports = []
  	@tests = []
  	for i in 0..6 do
  		@reports += Event.where(deadline: Date.today+i)
  		@tests += Event.where(deadline: Date.today+i)
  	end

  	# @tests = 'huga'
  	# @samashi = 'samashi'
  end
end
