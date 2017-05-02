class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  private

  def confirm_logged_in
    notice_str = 'Please log in.'
    redirect_to access_login_path, notice: notice_str unless session[:user_id]
  end
end
