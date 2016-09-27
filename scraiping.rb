# -*- coding: utf-8 -*-
require 'capybara'
require 'capybara/dsl'
require 'selenium-webdriver'

Capybara.current_driver = :selenium
Capybara.app_host = 'https://www.wsl.waseda.jp/syllabus/JAA101.php?pLng=jp'
Capybara.default_max_wait_time = 5

module Crawler
  class Syllabus
  	include Capybara::DSL

  	def search
  	  visit('')
  	  fill_in "keyword",
  	    :with => '解析力学'
  	  click_button " 検  索 "
  	end

  	def report(a)
  		within(:xpath, "//*[@class='ct-vh']") do
  			puts "科目名:"+all('td')[a].text
  		end
  	end
  end
end

crawler = Crawler::Syllabus.new
crawler.search
crawler.report(1)