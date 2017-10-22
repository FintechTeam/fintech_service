class TwitterBot

  class << self
    def get_price(acquisition_count)
        Coincheck.get_price(acquisition_count)
        Bitbank.get_price(acquisition_count)
        Bitflyer.get_price(acquisition_count)
        Zaif.get_price(acquisition_count)
        Btcbox.get_price(acquisition_count)
        # Fisco.get_price(acquisition_count)
    end
    def get_info
      if Price.count == 0
        acquisition_count = 1
      else
        acquisition_count = Price.last.acquisition_count + 1
      end
      get_price(acquisition_count)
      ps = Price.where(acquisition_count: acquisition_count).all
      tweet_array = []
      ps.each do |p|
        name = p.exchange.name
        bid = p.bid.to_s
        ask = p.ask.to_s
        arr = []
        tweet_array.push(name + "売" + bid + "買" + ask)
      end
      tweet_array
      tweet_info(tweet_array)
    end

    def tweet_info(tweet_array)
      text = tweet_array[0] + tweet_array[1] + tweet_array[2] + tweet_array[3] + tweet_array[4]
      TwitterApi.tweet(text)
    end
  end
end
