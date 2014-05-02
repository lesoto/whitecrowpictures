require File.expand_path('../boot', __FILE__)

require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"

Bundler.require(*Rails.groups)

module Whitecrowpictures
  class Application < Rails::Application
    I18n.load_path = Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    I18n.default_locale = :en
    I18n.enforce_available_locales = false
    config.serve_static_assets = true
  end
end
