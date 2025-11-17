class GamesController < ApplicationController

  def new
    @game = Game.new
    @game.scenario = Scenario.find(params[:scenario_id])
  end

  def create
    @game = Game.new(game_params)
    @game.scenario = Scenario.find(params[:scenario_id])
    @game.user = current_user
    @game.active!
    if @game.save
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
