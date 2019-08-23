class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = @post.comments.new comment_params
    if @comment.save
      redirect_to posts_path, notice: 'comment was succesfully posted '
    else
      redirect_to posts_path, notice: 'writeup was not posted'
  end

  private

  def comment_params
    params.permit(:writeup)
  end
end
