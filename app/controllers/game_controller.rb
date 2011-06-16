class GameController < ApplicationController
  before_filter :authenticate_user!, :except => [:home]
  load_and_authorize_resource :except => [:home]

  rescue_from ActiveRecord::RecordNotFound do |exception|
    flash[:alert] = "Game not found."
    redirect_to root_url
  end

  def home
    if user_signed_in?
      redirect_to games_path and return
    end

    render :layout => false
  end

  def index
  end

  def show
  end

  def new
    @languages = Language.enabled
    @game = Game.new
  end

  def create
    @game.user = current_user

    if @game.save
      @game.set_current_level_if_none
      redirect_to @game, :notice => 'New game successfully created.'
    else
      render :action => "new"
    end
  end

  def destroy
    @game.destroy
    redirect_to games_path
  end

end
