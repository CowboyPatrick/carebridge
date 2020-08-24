class Api::V1::LinebotsController < Api::V1::BaseController
  require 'line/bot'


  def get_id
    @client ||= Line::Bot::Client.new { |config|
      config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
      config.channel_token = ENV["LINE_ACCESS_TOKEN"]
    }
    body = request.body.read

    # signature = request.env['HTTP_X_LINE_SIGNATURE']
    # unless @client.validate_signature(body, signature)
    #   error 400 do 'Bad Request' end
    # end

    events = @client.parse_events_from(body)
    events.each do |event|
      p event

      case event.type
      # when receive a text message
      when Line::Bot::Event::MessageType::Text
        # search = event['message']['text']
        @user = User.find_by(username: event['message']['text'].strip)
        authorize @user
        p @user
        fuck = event['source']['userId']
        p @user
        @user.update(line_id: event['source']['userId']) ? "SAVED!" : "FAILED!"
        # @user.save
        p "SAVED!"
        p @user.valid?
        p @user.errors.messages
        # @client.reply_message(event['replyToken'], "Thanks for connecting")
      end
    end
  end

  def emergency
  end
end

# I need to get the carebridge username from the text
# from there i can get the user_id
# I can store the string from the source for the userId with our user
