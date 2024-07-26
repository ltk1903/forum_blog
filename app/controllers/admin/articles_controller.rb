class Admin::ArticlesController < ApplicationController
  before_action :require_admin

  def index
    @articles = Article.all
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to admin_articles_path, notice: 'Article updated successfully'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to admin_articles_path, notice: 'Article deleted successfully'
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :image)
  end

  def require_admin
    unless Current.user&.admin?
      redirect_to root_path, alert: 'You are not authorized to access this page.'
    end
  end
end
