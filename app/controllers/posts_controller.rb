class PostsController < ApplicationController

  skip_before_filter :verify_authenticity_token, only: [:like, :unlike]
  before_action :set_post, only: [:show, :like, :unlike]

  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result
              .order(id: :desc)
              .page(params[:page])
              .per(params[:per_page])

    render json: @posts,
           url: request.base_url,
           meta: pagination_dict(@posts),
           status: 200
  end

  def like
    @post.like
    render json: @post, status: 200
  end

  def unlike
    @post.unlike
    render json: @post, status: 200
  end

  def show
    render json: @post, url: request.base_url, status: 200
  end

  private

  def set_post
    @post = Post.find params[:id]
  end

end
