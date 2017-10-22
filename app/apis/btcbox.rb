class Btcbox
  class << self
    # https://docs.bitbank.cc/

    # ticker
    def ticker
      key = "API_KEY"
      secret = "API_SECRET"
      endpoint_url = "https://www.btcbox.co.jp/api/v1/ticker/"
      uri = URI.parse endpoint_url

      https = Net::HTTP.new(uri.host, uri.port)
      https.use_ssl = true
      response = https.start {
        https.get(uri.request_uri)
      }
      json = response.body
      hash = JSON.parse json
    end

    def get_price
      p = Price.new
      p.acquisition_time = DateTime.now
      p.ask = ticker["buy"]
      p.bid = ticker["sell"]
      p.exchange_id = 5
      p.save
    end
  end
end
