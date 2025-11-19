class GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
    @message = Message.new

  end



  private

  def game_params
    params.require(:game).permit(:name, :character_name)
  end
end
