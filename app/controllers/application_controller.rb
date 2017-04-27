class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token, only: [:like, :unlike, :update, :create]

  def pagination_dict(collection)
    {
      current_page: collection.current_page,
      next_page: collection.next_page,
      prev_page: collection.prev_page,
      total_pages: collection.total_pages,
      total_count: collection.total_count,
      per_page: Kaminari.config.default_per_page
    }
  end

end
