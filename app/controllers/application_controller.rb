class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  private

  def confirm_logged_in
    unless session[:user_id]
      redirect_to access_login_path, notice: "Please log in."
      # redirect_to prevents requeted action from running
    end
  end
end
