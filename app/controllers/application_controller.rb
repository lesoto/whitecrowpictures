class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :exception
  before_filter :set_locale, :default_url_options

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

	def default_url_options(options={})
  		{ :locale => I18n.locale }
	end

  protected

  def redirect_path
    :root
  end

end
