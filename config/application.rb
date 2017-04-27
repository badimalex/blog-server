require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module BlogServer
  class Application < Rails::Application
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', :headers => :any, :methods => [:get, :patch, :options, :put, :post]
      end
    end

    config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]

    config.i18n.default_locale = :ru

  end
end
