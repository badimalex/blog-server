class PostsController < ApplicationController
  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result.page(params[:page])
    render json: @posts,
           url: request.base_url,
           meta: pagination_dict(@posts),
           status: 200
  end

  def show
    @post = Post.find params[:id]
    render json: @post, url: request.base_url, status: 200
  end
end
