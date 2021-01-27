require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    Rails.application.config.assets.paths << Rails.root.join("app", "assets", "javascripts", "demo")
    Rails.application.config.assets.paths << Rails.root.join("vendor", "bootstrap", "js")
    Rails.application.config.assets.paths << Rails.root.join("vendor", "bootstrap", "scss")
    Rails.application.config.assets.paths << Rails.root.join("vendor", "chart.js")
    Rails.application.config.assets.paths << Rails.root.join("vendor", "datatables")
    Rails.application.config.assets.paths << Rails.root.join("vendor", "fontawesome-free")
    Rails.application.config.assets.paths << Rails.root.join("vendor", "jquery")
    Rails.application.config.assets.paths << Rails.root.join("vendor", "jquery-easing")
    Rails.application.config.assets.precompile += %w(*.eot *.woff *.woff2 *.ttf *.svg *.otf *.png *.jpg *.gif chart-pie-demo.js chart-area-demo.js application.js sb-admin-2.js jquery.min.js bootstrap.bundle.min.js jquery.easing.min.js sb-admin-2.min.js Chart.min.js )
  end
end
