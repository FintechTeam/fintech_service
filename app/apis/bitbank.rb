class Bitbank
  class << self
    # https://docs.bitbank.cc/

    # ticker
    def ticker(pair)
      key = "API_KEY"
      secret = "API_SECRET"
      endpoint_url = "https://public.bitbank.cc/" + pair + "/ticker"
      uri = URI.parse endpoint_url

      https = Net::HTTP.new(uri.host, uri.port)
      https.use_ssl = true
      response = https.start {
        https.get(uri.request_uri)
      }
      json = response.body
      hash = JSON.parse json
    end
  end
end
