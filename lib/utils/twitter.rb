# coding:utf-8
require 'twitter'

class Bot
  attr_accessor :client

  def initialize
    #アカウントの設定
    @client=Twitter::REST::Client.new{|config|
      config.consumer_key="＃"
      config.consumer_secret="＃"
      config.access_token="＃"
      config.access_token_secret="＃"
    }


    TweetStream.configure do |config|
      config.consumer_key = "＃"
      config.consumer_secret = "＃"
      config.oauth_token = "＃"
      config.oauth_token_secret = "＃"
      config.auth_method = :oauth
    end

    @timeline = TweetStream::Client.new
  end

  #tweet　リプライかそうでないかをifで定義
  def post(text = "", twitter_id:nil, status_id:nil)
    if status_id
      rep_text = "@#{twitter_id} #{text}"
      @client.update(rep_text, {:in_reply_to_status_id => status_id})
      puts "#{rep_text}"
    else
      @client.update(text)
      puts "#{text}"
    end
  end

  def fav(status_id:nil)
    if status_id
      @client.favorite(status_id)
    end
  end

  def retweet(status_id:nil)
    if status_id
      @client.retweet(status_id)
    end
  end

end
