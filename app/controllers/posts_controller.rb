class PostsController < ApplicationController

  before_action :set_post, only: [:show, :like, :unlike, :update]

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

  def update
    if @post.update(post_params)
      render json: @post, url: request.base_url, status: 200
    else
      render json: @post.errors, status: 422
    end
  end

  private

  def set_post
    @post = Post.find params[:id]
  end

  def post_params
    params.require(:post).permit :title, :description, :author, :created_at
  end

end
