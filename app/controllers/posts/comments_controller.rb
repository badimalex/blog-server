class Posts::CommentsController < ApplicationController
  before_action :set_post

  def create
    @comment = @post.comments.new comment_params
    respond_success @comment.save, @comment
  end

  private

  def comment_params
    params.require(:comment).permit :user_name, :user_avatar, :text
  end

  def set_post
    @post = Post.find_by(id: params[:post_id])
  end
end
