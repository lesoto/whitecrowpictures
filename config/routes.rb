Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
	get 'index' => 'pages#index'
  	get 'photography' => 'pages#photography'
  	get 'portfolio' => 'pages#portfolio'
  	get 'gallery' => 'pages#gallery'
  	get 'contact' => 'pages#contact'

  scope "/:locale" do
  	resources :pages
  end

  	get '/' => 'pages#index', :as => "root"

end
