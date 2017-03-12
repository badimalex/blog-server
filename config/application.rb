require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module BlogServer
  class Application < Rails::Application
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', :headers => :any, :methods => [:get, :patch, :options]
      end
    end
  end
end
