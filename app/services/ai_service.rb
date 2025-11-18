class AiService
  def initialize(attr = {})
    @game = attr[:game]
    @user_message = attr[:user_message]
  end

  def call
    client = OpenAI::Client.new
    response = client.chat(
      parameters: {
        model: "gpt-3.5-turbo",
        messages: build_messages
      }
    )
    JSON.parse(response.dig("choices", 0, "message", "content"))
  end

  private

  def build_messages
    messages = []
    messages << { role: "system", content: @game.scenario.prompt }
    if @user_message
      @game.messages.each do |message|
        messages << { role: message.role, content: message.content }
      end
      messages << { role: "user", content: @user_message }
    else
      messages << { role: "user", content: "Commence l'aventure pour le personnage qui s'appelle #{@game.character_name}"}
    end
    messages
  end
end
