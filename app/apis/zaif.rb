class Zaif
  class << self
    # https://docs.bitbank.cc/

    # ticker
    def ticker
      key = "API_KEY"
      secret = "API_SECRET"
      endpoint_url = "https://api.zaif.jp/api/1/ticker/btc_jpy"
      uri = URI.parse endpoint_url

      https = Net::HTTP.new(uri.host, uri.port)
      https.use_ssl = true
      response = https.start {
        https.get(uri.request_uri)
      }
      json = response.body
      hash = JSON.parse json
    end

    def get_price(acquisition_count)
      p = Price.new
      p.acquisition_time = DateTime.now
      p.ask = ticker["ask"]
      p.bid = ticker["bid"]
      p.exchange_id = 4
      p.acquisition_count = acquisition_count
      p.save
    end
  end
end