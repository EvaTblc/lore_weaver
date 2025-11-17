class ScenariosController < ApplicationController
  def index
    @scenarios = Scenario.active
  end
end
