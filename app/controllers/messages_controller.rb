class MessagesController < ApplicationController

  def create
    @game = Game.find(params[:game_id])
    @user_message = @game.messages.build(message_params)
    @user_message.role = "user"
    @user_message.save!
    ai_response = AiService.new(game: @game, user_message: @user_message.content).call

    @assistant_message = @game.messages.create!(
      role: "assistant",
      content: ai_response["narration"]
    )

    @game.apply_changes(ai_response["changes"]) if ai_response["changes"]

    redirect_to game_path(@game)
  end


  private

  def message_params
    params.require(:message).permit(:content)
  end
end
