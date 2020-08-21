require 'line/bot'

class LinebotJob < ApplicationJob
  queue_as :default

  def perform(order)
    @client ||= Line::Bot::Client.new { |config|
      config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
      config.channel_token = ENV["LINE_ACCESS_TOKEN"]
    }
    order_message = "Hello, #{order.user.caregiver.first_name.capitalize}. #{order.user.first_name.capitalize} ordered:\n"
    order.provider_actions.each do |item|
      order_message += item.name.capitalize  + "\n"
    end

    p order_message

    message = {
      type: 'text',
      text: order_message
    }
    @client.push_message("Ud793bafaed4535fe335e3b21ac1735c5", message)
  end

end
