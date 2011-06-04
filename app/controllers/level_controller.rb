class LevelController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_game_and_level

  def show
    authorize! :show, @level, @game
  end

  def challenge
    if @level.is_vocab?
      @testing = @level.vocab
    else
      @testing = @level.sentences
    end

    authorize! :challenge, @level, @game
  end

  def success
    authorize! :challenge, @level, @game

    if @game.current_level == @level
      if @game.has_next_level?
        @game.goto_next_level
        flash[:notice] = 'Next level unlocked!'
      else
        # TODO could just be playing last level
        flash[:notice] = 'Game complete - congrats!'
      end
    end

    redirect_to games_path
  end

  protected

  def load_game_and_level
    @game = Game.find(params[:game_id])
    @level = Level.find(params[:id])
  end

end
