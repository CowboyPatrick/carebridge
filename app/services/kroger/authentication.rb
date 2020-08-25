require 'open-uri'
require 'base64'

module Kroger

  class Authentication
    def self.call(*args, &block)
      new(*args, &block).execute
    end

    def initialize
      @client_id = ENV["KROGER_CLIENT_ID"]
      @secret = ENV["KROGER_CLIENT_SECRET"]
    end

    def execute
      encode = Base64.encode64("#{@client_id}:#{@secret}")


      response = RestClient.post("https://api.kroger.com/v1/connect/oauth2/token",
                                 {'grant_type' => 'client_credentials', 'scope' => 'product.compact'},
                                 content_type: "application/x-www-form-urlencoded",
                                 authorization: "Basic #{ENV['KROGER_BASIC']}")

      return JSON.parse(response)['access_token']
    end
  end
end
