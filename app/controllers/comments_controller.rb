class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(comment_params)
    @comment.user = Current.user

    if @comment.save
      redirect_to @article
    else
      redirect_to @article, alert: "Comment could not be created."
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :image)
  end
end
