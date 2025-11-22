require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module Rockstar
  class Application < Rails::Application
    config.load_defaults 8.1
    config.autoload_lib(ignore: %w[assets tasks])
    config.i18n.default_locale = :es
    config.i18n.available_locales = [:es, :en]
    config.i18n.fallbacks = [:en]
  end
end

