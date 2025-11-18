class CharactersController < ApplicationController
  def new
    @character = Character.new
  end

  def create
    @character = Character.new(character_params)

    @character.scenario = Scenario.find(params[:scenario_id])
    @character.skills = @character.scenario.available_classes[@character.character_class]["skills"]
    if @character.save #A PEAUFINER
      @game = Game.new(game_params)
      @game.character = @character
      @game.user = current_user
      @game.game_state = @character.scenario.initial_game_state
      @game.game_state["inventory"] = @character.scenario.available_classes[@character.character_class]["starting_items"]
      @game.active!
      ai_response = AiService.new(game: @game).call
        if @game.save
          @game.messages.create!(role: "assistant", content: ai_response)
          redirect_to game_path(@game)
        else
          render :new
        end
    else
      render :new
    end
  end

  private

  def character_params
    params.require(:character).permit(:name, :character_class)
  end

  def game_params
    params.require(:game).permit(:name)
  end
end
