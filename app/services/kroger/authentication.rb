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

      token = URI.open("https://api.kroger.com/v1/connect/oauth2/token",
                       "Content-Type" => "application/x-www-form-urlencoded",
                       "Authorization" => "Basic #{encode}")
    end
  end
end
