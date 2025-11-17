class AiService
  def initialize(game, user_message)
    @game = game
    @user_message = user_message
  end

  def call
    client = OpenAI::Client.new

    response = client.chat(
      parameters: {
        model: "gpt-3.5-turbo",
        messages: build_messages
      }
    )

    response.dig("choices", 0, "message", "content")
  end

  private

  def build_messages
    messages = []

    messages << { role: "system", content: @game.scenario.prompt }

    @game.messages.each do |message|
      messages << { role: message.role, content: message.content }
    end

    messages << { role: "user", content: @user_message }

    messages
  end
end
