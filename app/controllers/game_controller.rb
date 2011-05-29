class GameController < ApplicationController
  load_and_authorize_resource :except => [:home]

  def home
    @languages = Language.all
  end

  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def destroy
  end

end
