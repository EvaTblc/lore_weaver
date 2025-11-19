class CharactersController < ApplicationController
  def new
    @character = Character.new
    @scenario = Scenario.find(params[:scenario_id])
  end

  def create
    @character = Character.new(character_params)
    @character.scenario = Scenario.find(params[:scenario_id])
    @character.skills = @character.scenario.available_classes[@character.character_class]["skills"]

    puts "Character avant save: #{@character.inspect}"
    puts "Character valid? #{@character.valid?}"
    puts "Character errors: #{@character.errors.full_messages}" unless @character.valid?

    if @character.save
      puts "Character sauvegardé!"
      @game = Game.new
      @game.name = params[:game_name]
      @game.character = @character
      @game.scenario = @character.scenario
      @game.user = current_user
      @game.game_state = @character.scenario.initial_game_state
      @game.game_state["inventory"] = @character.scenario.available_classes[@character.character_class]["starting_items"]
      @game.active!
      ai_response = AiService.new(game: @game).call
        if @game.save
          @game.messages.create!(role: "assistant", content: ai_response["narration"])
          redirect_to game_path(@game)
        else
          puts "Erreurs Game: #{@game.errors.full_messages}"
          @scenario = @character.scenario

          render :new
        end
    else
      puts "Character PAS sauvegardé!"
      @scenario = @character.scenario
      render :new
    end
  end

  private

  def character_params
    params.require(:character).permit(:name, :character_class)
  end
end
