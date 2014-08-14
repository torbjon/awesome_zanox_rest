module AwesomeZanox
  class InstanceResource
    attr_accessor :connect_id, :secret_key

    def initialize(connect_id = '', secret_key = '')
      @connect_id, @secret_key = connect_id.strip, secret_key.strip
    end

    def conn
      Faraday.new(url: AwesomeZanox::Client::API_URL) do |faraday|
        faraday.request :url_encoded
        # faraday.response :logger
        faraday.adapter Faraday.default_adapter
      end
    end

    def request(opts = {})
      response = conn.get do |req|
        req.url opts[:url]
        req.params  = opts[:params] if opts[:params]
        req.headers = auth_signature("/#{opts[:url]}")
      end
      MultiJson.load response.body
    end

    def auth_signature(url, method = 'GET', date = nil, nonce = nil)
      nonce ||= SecureRandom.hex
      date  ||= Time.now.utc.strftime('%a, %d %h %Y %T GMT')
      string_to_sign = [method, url, date, nonce].join('')
      raw_hmac = OpenSSL::HMAC.digest('sha1', @secret_key, string_to_sign)
      signature = Base64.encode64(raw_hmac).gsub("\n", '')
      {
        'Authorization' => "ZXWS #{connect_id}:#{signature}",
        'Date' => date,
        'nonce' => nonce
      }
    end
  end
end
