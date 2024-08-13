class Admin::UsersController < ApplicationController
  # before_action :require_admin

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_users_path, notice: 'User updated successfully'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path, notice: 'User deleted successfully'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :role)
  end

  def require_admin
    unless Current.user&.admin?
      redirect_to root_path, alert: 'You are not authorized to access this page.'
    end
  end
end
