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
    
    I18n.default_locale = :en
    I18n.available_locales = [:en, :ru, :he]
    I18n.load_path = Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    I18n.enforce_available_locales = false

    config.serve_static_assets = true
    config.assets.enabled = true
    config.assets.precompile = [/^[a-z0-9\/]*[a-z0-9]\w+.(css|js|scss|jpg|gif|png)$/]

    config.action_mailer.delivery_method = :sendmail
	config.action_mailer.perform_deliveries = true
	config.action_mailer.raise_delivery_errors = true

	ActionMailer::Base.smtp_settings = {
    address: 'smtp.mandrillapp.com',
    port: 587,
    #user_name: ENV['MANDRILL_USERNAME'],
    #password: ENV['MANDRILL_APIKEY']
    user_name: 'dima@pesochin.com',
    password: 'pOVU3eT21EnZ_wsgM5eR1w'
}
  end
end
