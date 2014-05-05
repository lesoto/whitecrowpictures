== README

This file explains how to install and operate White Crow Pictures application. 

Live demo could be accessed here - http://whitecrowpictures.herokuapp.com/

Here are the steps necessary to get everything running on the production.

(0) Set up your development and hosting environment and establish deployment procedure. Everyone has his own preferences, use whatever works for you. It's recommended to develop locally in the same environment as you have on your production, including database system and the same version of Ruby. We are going to be using Heroku as a hosting platform. As of May of 2014 Heroku uses Ruby version 2.0.0 and PostgreSQL.

(1) Download White Crow Pictures application from GitHub - 
	
	$ git clone git@heroku.com:whitecrowpictures.git
 
(2) Run bundle to install all gems and "rake db:migrate" to set up database.

(3) Add this to Add this to application.rb file to allow deployment to Heroku. No local or Heroku "rake:assets:precompile" is necessary 

	config.serve_static_assets = true
  	config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect'
  	config.assets.compile = true

(4) Add this to application.rb file to allow localization
	
	I18n.default_locale = :en
    I18n.available_locales = [:en, :ru, :he]
    I18n.load_path = Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    I18n.enforce_available_locales = false

(5) Create new Git repository for your project

	$ git init
	$ git add .
	$ git commit -m "init"
	$ git push --set-upstream https://github.com/lesoto/whitecrowpictures.git master

	
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

(8) Monitor status of the application by running 
	$ heroku logs