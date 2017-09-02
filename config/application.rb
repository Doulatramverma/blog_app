require_relative 'boot'


require 'rails/all'
 #config.time_zone = 'New Delhi'
# config.beginning_of_week = :sunday
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BlogApp
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.assets.precompile += %w( frontend.css )
  end
end
