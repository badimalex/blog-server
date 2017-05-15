module Shared::RespondCrud

  extend ActiveSupport::Concern

  included do
    before_action :set_model, only: [:index, :show, :new, :create,
                                     :edit, :update, :destroy]
  end

  private

  def set_model; end

  def form_params
    @model.name.underscore.gsub('/', '_')
  end

  def render_crud(resource, success = true, options = {})
    return render_success resource, options if success
    render_failure resource, options
  end

  def render_success(resource, options)
    json = options[:message] || options[:json] || resource || {}
    render status: options[:status] || 200, json: json
  end

  def render_failure(resource, options)
    json = resource.as_json(methods: :errors) rescue {}
    render status: options[:status] || 422, json: json
  end

  def render_partial(partial, locals)
    partial = partial_to_string partial, locals
    render_crud nil, true, { json: { partial: partial } }
  end

  def partial_to_string(partial, locals)
    render_to_string partial: partial, locals: locals, layout: false,
                     formats: [:html, :json]
  end

  def respond_success(success = true, resource)
    if success
      render json:resource, url: request.base_url, status: 200
    else
      render json: resource.errors, status: 422
    end
  end

  def render_new
    render :new
  end

  def render_edit
    render :edit
  end

  def redirect_crud
    render json: @post, url: request.base_url, status: 200
  end

end
