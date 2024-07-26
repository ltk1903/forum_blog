class Admin::CommentsController < ApplicationController
  before_action :require_admin

  def index
    @comments = Comment.all
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to admin_comments_path, notice: 'Comment deleted successfully'
  end

  private

  def require_admin
    unless Current.user&.admin?
      redirect_to root_path, alert: 'You are not authorized to access this page.'
    end
  end
end
