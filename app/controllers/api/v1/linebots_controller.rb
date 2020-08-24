class Api::V1::LinebotsController < Api::V1::BaseController
  before_action :set_body
  require 'line/bot'

  def get_id
    @client ||= Line::Bot::Client.new { |config|
      config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
      config.channel_token = ENV["LINE_ACCESS_TOKEN"]
    }

    # signature = request.env['HTTP_X_LINE_SIGNATURE']
    # unless @client.validate_signature(body, signature)
    #   error 400 do 'Bad Request' end
    # end

    events = @client.parse_events_from(@body)
    events.each do |event|
      case event.type
      # when receive a text message
      when Line::Bot::Event::MessageType::Text
        @user = User.find_by(username: event['message']['text'].strip)
        authorize @user
        @user.update(line_id: event['source']['userId'])
      end
    end
  end

  # def emergency
  #   p @body
  #   render :no_content
  # end

  private

  def set_body
    @body = request.body.read
  end
end
