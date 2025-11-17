class MessagesController < ApplicationController

  def create
    @game = Game.find(params[:game_id])
    @user_message = @game.messages.build(message_params)
    @user_message.role = "user"
    @user_message.save!
    ai_response = AiService.new(@game, @user_message.content).call
    @assistant_message = @game.messages.create!(
      role: "assistant",
      content: ai_response
    )
    redirect_to game_path(@game)
  end


  private

  def message_params
    params.require(:message).permit(:content)
  end
end
