class AdminUsersController < ApplicationController

  layout 'admin'

  before_action :confirm_logged_in

  def index
    @admin_users = AdminUser.sorted
  end

  def new
    @admin_user = AdminUser.new
  end

  def create
    @admin_user = AdminUser.new(admin_user_params)
    if @admin_user.save
      redirect_to admin_users_path, notice: "Admin user created successfully."
    else
      render('new')
    end
  end

  def edit
    @admin_user = AdminUser.find(params[:id])
  end

  def destroy
    @admin_user = AdminUser.find(params[:id])
    @admin_user.destroy
    redirect_to admin_users_path, notice: "Admin user destroyed successfully."
  end

  private

  def admin_user_params
    # Permit :password, but NOT :password_digest
    params.require(:admin_user).permit(
      :first_name,
      :last_name,
      :email,
      :username,
      :password
    )
  end

end
