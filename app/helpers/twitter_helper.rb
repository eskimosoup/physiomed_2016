module TwitterHelper
  def twitter_connect
    @twitter ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = 'weKIDcKDPyEAT9pN9eFlXg'
      config.consumer_secret     = 'XIa5VRSGV2yepe3JwQfZqsatGABKTfbfhv5AOp6RWWc'
      config.access_token        = '2250321354-N1SAGmbNdOtLnoJeva3AhTD5DORGXd6unggtBTG'
      config.access_token_secret = '5aRup8mz4tBs2cE2ycyCHUypEi1edLCgOMi0B3i8HsDul'
    end
  end

  def twitter_timeline(twitter, limit)
    twitter_connect.user_timeline(twitter.delete('@'), count: limit)
  end

  def tweet_text(text)
    scan_for_links text
  end

  def tweet_time(time)
    "#{time_ago_in_words time} ago"
  end

  def scan_for_links(text)
    result = ''
    for word in text.split(' ')
      if word.include?('http://') || word.include?('https://')
        result << link_to(word, word, target: '_blank').to_s + ' '
      elsif word.start_with?('#')
        result << link_to(word, "https://twitter.com/#{word}", target: '_blank').to_s + ' '
      elsif word.start_with?('@')
        result << link_to(word, "https://twitter.com/#{word[1..-1].delete(':')}", target: '_blank').to_s + ' '
      else
        result << "#{word} "
      end
    end
    result
  end
end
