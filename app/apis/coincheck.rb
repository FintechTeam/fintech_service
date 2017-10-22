class Coincheck
  class << self
    # https://coincheck.com/ja/documents/exchange/api

    # ticker
    def ticker
      key = "API_KEY"
      secret = "API_SECRET"
      uri = URI.parse "https://coincheck.com/api/ticker/"
      nonce = Time.now.to_i.to_s
      message = nonce + uri.to_s
      signature = OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new("sha256"), secret, message)
      headers = {
        "ACCESS-KEY" => key,
        "ACCESS-NONCE" => nonce,
        "ACCESS-SIGNATURE" => signature
      }

      https = Net::HTTP.new(uri.host, uri.port)
      https.use_ssl = true
      response = https.start {
        https.get(uri.request_uri, headers)
      }
      json = response.body
      hash = JSON.parse json
    end

    def order_books
      key = "API_KEY"
      secret = "API_SECRET"
      endpoint_url = "https://coincheck.com" + "/api/order_books"
      uri = URI.parse endpoint_url

      https = Net::HTTP.new(uri.host, uri.port)
      https.use_ssl = true
      response = https.start {
        https.get(uri.request_uri)
      }
      json = response.body
      hash = JSON.parse json
    end

    def rate(type)
      key = "API_KEY"
      secret = "API_SECRET"
      type = type.to_s
      endpoint_url = "https://coincheck.com/api/exchange/orders/rate?order_type=" + type + "&pair=btc_jpy&amount=1"
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
