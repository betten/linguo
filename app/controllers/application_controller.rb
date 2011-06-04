class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = "Access denied."
    if user_signed_in?
      redirect_to games_path
    else
      redirect_to root_url
    end
  end

end
