class TwitterApi
  @client = Twitter::REST::Client.new do |config|
    config.consumer_key = "hdFeLjgCn1YAuRVD4Pao9XIxN"
    config.consumer_secret = "73DqUf6mr42xMegktiSqzJxtIoBVjo61jknXOYARulSnbEDxz1"
    config.access_token = "912125773372284928-GDuBPf7A2MlbxELDS40QrwENIZMgeFi"
    config.access_token_secret = "DRNCWNPhSiuXUonHo8xgXd8UF5gR8pAR0FrT1BMYkspWu"
  end

  class << self
    def tweet(msg)
      @client.update msg
    end

    def follow(target_id)
      @client.follow target_id
    end

    def search(*args)
      @client.search *args
    end
  end
end
