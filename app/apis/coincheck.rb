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
  end
end
