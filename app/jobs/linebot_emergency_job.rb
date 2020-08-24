require 'line/bot'

class LinebotEmergencyJob < ApplicationJob
  queue_as :default

  def perform(senior, coordinates)
    @client ||= Line::Bot::Client.new { |config|
      config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
      config.channel_token = ENV["LINE_ACCESS_TOKEN"]
    }
    order_message = "Hello, #{senior.caregiver.first_name.capitalize}. #{senior.first_name.capitalize} has signaled an emergency!\nhttps://www.google.com/maps/search/35.6324597,139.7013585#{coordinates}"

    message = {
      type: 'text',
      text: order_message
    }
    @client.push_message("Ud793bafaed4535fe335e3b21ac1735c5", message)
  end
end
