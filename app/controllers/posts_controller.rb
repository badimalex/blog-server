class PostsController < ApplicationController

  before_action :set_post, only: [:show, :like, :unlike, :update]

  def index
    @q = @model.ransack params[:q]
    @posts = @q.result
              .order(id: :desc)
              .page(params[:page])
              .per(params[:per_page])

    render json: @posts,
           url: request.base_url,
           meta: pagination_dict(@posts),
           status: 200
  end

  def show
    render json: @post, url: request.base_url, status: 200
  end

  def create
    @post = @model.new post_params
    respond_success @post.save, @post
  end

  def update
    respond_success @post.update(post_params), @post
  end

  def like
    respond_success @post.like, @post
  end

  def unlike
    respond_success @post.unlike, @post
  end

  private

  def set_model
    @model = ::Post
  end

  def set_post
    @post = @model.find params[:id]
  end

  def post_params
    params.require(:post).permit :title, :description, :author, :created_at
  end

end
