# coding:utf-8
require 'twitter'

class Bot
  attr_accessor :client

  def initialize
    #アカウントの設定
    @client=Twitter::REST::Client.new{|config|
      config.consumer_key="5Qk9x5Q2Y1iHDtXUK4X1xIlR1"
      config.consumer_secret="8fHjI2s49rn5e6BA1gJX8J0yQ9zpMsZPTr50WqdxCXpl0zSbX8"
      config.access_token="723124543951237120-9dsC1CnHpjSRG6EMmgLqTSrRU3rSfXs"
      config.access_token_secret="kplGuWjgyKqmSvJ8F7BwpiMJMt1TsBH5uQ5wIv3pmakIt"
    }


    TweetStream.configure do |config|
      config.consumer_key = "5Qk9x5Q2Y1iHDtXUK4X1xIlR1"
      config.consumer_secret = "8fHjI2s49rn5e6BA1gJX8J0yQ9zpMsZPTr50WqdxCXpl0zSbX8"
      config.oauth_token = "723124543951237120-9dsC1CnHpjSRG6EMmgLqTSrRU3rSfXs"
      config.oauth_token_secret = "kplGuWjgyKqmSvJ8F7BwpiMJMt1TsBH5uQ5wIv3pmakIt"
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