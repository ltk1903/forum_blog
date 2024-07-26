class Admin::DashboardController < ApplicationController
  before_action :require_admin

  def index
  end

  private

  def require_admin
    unless Current.user&.admin?
      redirect_to root_path, alert: "You are not authorized to access this page."
    end
  end
end
