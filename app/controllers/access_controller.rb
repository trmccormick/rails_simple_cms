class AccessController < ApplicationController

  layout 'admin'

  before_action :confirm_logged_in, except: %i[login attempt_login logout]

  def menu
    # display text & links
    @username = session[:username]
  end

  def login
    # login form
  end

  def attempt_login
    if params[:username].present? && params[:password].present?
      found_user = AdminUser.where(username: params[:username]).first
      authorized_user = found_user.authenticate(params[:password]) if found_user
    end

    if authorized_user
      session[:user_id] = authorized_user.id
      session[:username] = authorized_user.username
      redirect_to admin_path, notice: 'You are now logged in.'
    else
      flash.now[:notice] = 'Invalid username/password combination.'
      render('login')
    end
  end

  def logout
    session[:user_id] = nil
    session[:username] = nil
    redirect_to access_login_path, notice: 'Logged out'
  end
end
