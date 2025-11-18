class GamesController < ApplicationController
  def create
    @game = Game.new(game_params)
    @game.scenario = Scenario.find(params[:scenario_id])
    @game.user = current_user
    @game.game_state = {
      "health": 20,
      "inventory": nil,
      "gold": 0
    }
    @game.active!
    ai_response = AiService.new(game: @game).call
    if @game.save
      @game.messages.create!(role: "assistant", content: ai_response)
      redirect_to game_path(@game)
    else
      render :new
    end
  end

  def show
    @game = Game.find(params[:id])
    @message = Message.new
  end



  private

  def game_params
    params.require(:game).permit(:name, :character_name)
  end
end
