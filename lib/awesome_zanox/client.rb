module AwesomeZanox
  class Client
    API_URL = 'https://api.zanox.com/json/2011-03-01/'

    attr_accessor :connect_id, :secret_key

    def initialize(connect_id, secret_key)
      @connect_id, @secret_key = connect_id.strip, secret_key.strip
    end

    def publisher
      @publisher ||= AwesomeZanox::Publisher.new(connect_id, secret_key)
    end

    def self.conn
      @conn ||= AwesomeZanox::Connection.new
    end
  end
end