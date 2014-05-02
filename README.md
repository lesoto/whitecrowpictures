== README

This README explains how to install and operate White Crow Pictures application.

Here are the steps necessary to get everything running on the production.

(0) Set up your development and hosting environment and establish deployment procedure. Everyone has his own preferences, use whatever works for you. It's recommended to develop locally in the same environment as you have on your production, including database system and the same version of Ruby. We are going to be using Heroku as a hosting platform. As of May of 2014 Heroku uses Ruby version 2.0.0 and PostgreSQL.

(1) Download White Crow Pictures application from GitHub - 
	
	$ git clone git@heroku.com:whitecrowpictures.git
 
(2) $ bundle install

(3) Create assets.rb configuration file and a line "Rails.application.config.assets.precompile = [/^[a-z0-9\/]*[a-z0-9]\w+.(css|js|scss)$/]" . run rake:assets:precompile 

(4) Add this to application.rb file - 
	
	I18n.load_path = Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    I18n.default_locale = :en
    config.assets.enabled = true
    config.assets.initialize_on_precompile = false     
    config.assets.paths << "#{Rails.root}/app/assets/fonts""

    config.serve_static_assets = true 
  

(5) Create new Git repository for your project

	$ git init
	$ git add .
	$ git commit -m "init"
	$ git push --set-upstream https://github.com/lesoto/whitecrowpictures.git master
or
	$ git remote add origin https://github.com/lesoto/whitecrowpictures.git
	$ git push -u origin master

(6) Create Heroku application

	$ heroku create
	$ heroku apps:rename newname
	$ git push heroku master

(7) Database creation and upload
	$ heroku config | grep HEROKU_POSTGRESQL
	$ heroku pg:push whitecrow HEROKU_POSTGRESQL_GRAY_URL

	$ heroku run rake db:migrate
