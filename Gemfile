source 'https://rubygems.org' do
  # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
  gem 'rails', '>= 5.0.0.beta3', '< 5.1'
  # Use postgresql as the database for Active Record
  gem 'pg', '~> 0.18'
  # Use Puma as the app server
  gem 'puma'
  # Use SCSS for stylesheets
  gem 'sass-rails', '~> 5.0'
  # Use Uglifier as compressor for JavaScript assets
  gem 'uglifier', '>= 1.3.0'
  # Use CoffeeScript for .coffee assets and views
  gem 'coffee-rails', '~> 4.1.0'
  # See https://github.com/rails/execjs#readme for more supported runtimes
  # gem 'therubyracer', platforms: :ruby

  # Use jquery as the JavaScript library
  gem 'jquery-rails'
  # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
  gem 'jbuilder', '~> 2.0'
  # Use Redis adapter to run Action Cable in production
  gem 'redis', '~> 3.0'
  # Use ActiveModel has_secure_password
  # gem 'bcrypt', '~> 3.1.7'

  # Use Capistrano for deployment
  # gem 'capistrano-rails', group: :development

  gem 'omniauth-github'
  gem 'httparty'

  group :development do
    gem 'capistrano',         require: false
    gem 'capistrano-rvm',     require: false
    gem 'capistrano-rails',   require: false
    gem 'capistrano-bundler', require: false
    gem 'capistrano3-puma',   require: false
    gem 'capistrano-sidekiq'
  end


  group :development, :test do
    gem 'pry'
    gem 'pry-rails'
  end

  group :development do
    # Access an IRB console on exception pages or by using <%= console %> in views
    gem 'listen', '~> 3.0.5'
    gem 'quiet_assets'
    gem 'web-console', '~> 3.0'
  end

  # Windows does not include zoneinfo files, so bundle the tzinfo-data gem
  gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
end

source 'https://rails-assets.org' do
  gem 'rails-assets-js-cookie'
end
