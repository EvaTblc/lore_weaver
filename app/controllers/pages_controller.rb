class PagesController < ApplicationController
  def home
    @scenarios = Scenario.all
    @active_games = current_user.games.all.active
    @done_games = current_user.games.all.where(status: "completed")
    @abandoned_games = current_user.games.all.where(status: "abandoned")
  end
end
