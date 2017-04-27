class Posts::CommentsController < ApplicationController
  before_action :set_post

  def create
    @comment = @post.comments.new comment_params
    if @comment.save
      render status: 201, json: @comment
    else
      render status: 422, :json => { :errors => @comment.errors }
    end
  end

  private

  def comment_params
    params.require(:comment).permit :user_name, :user_avatar, :text
  end

  def set_post
    @post = Post.find_by(id: params[:post_id])
  end
end
