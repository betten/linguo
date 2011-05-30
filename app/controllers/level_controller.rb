class LevelController < ApplicationController
  before_filter :authenticate_user!

  def show
    @game = Game.find(params[:game_id])
    @level = Level.find(params[:id])
  end

  def challenge
  end

end
