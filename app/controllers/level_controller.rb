class LevelController < ApplicationController
  before_filter :authenticate_user!

  def show
    @game = Game.find(params[:game_id])
    @level = Level.find(params[:id])
    authorize! :show, @level
  end

  def challenge
    @game = Game.find(params[:game_id])
    @level = Level.find(params[:id])

    if @level.is_vocab?
      @testing = @level.vocab
    else
      @testing = @level.sentences
    end

    authorize! :challenge, Level
  end

end
