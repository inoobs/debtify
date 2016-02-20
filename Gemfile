source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '>= 5.0.0.beta2', '< 5.1'
gem 'pg'
gem 'puma'

# Dezign
gem 'haml-rails'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'sass-rails', '~> 5.0'
gem 'bootstrap', '~> 4.0.0.alpha3'
source 'https://rails-assets.org' do
  gem 'rails-assets-tether', '>= 1.1.0'
end

# Rails
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
# Action Cable dependencies for the Redis adapter
gem 'redis', '~> 3.0'

# Cool stuff
gem 'dotenv-rails'
gem 'http'

# Authentication
gem 'devise', github: 'plataformatec/devise'

# OmniAuth
gem 'omniauth'
gem 'omniauth-google-oauth2'

group :development, :test do
  # Rubocop
  gem 'rubocop', require: false

  # Rspec
  gem 'rspec-rails', github: 'rspec/rspec-rails'
  gem 'rspec-support', github: 'rspec/rspec-support'
  gem 'rspec-core', github: 'rspec/rspec-core'
  gem 'rspec-expectations', github: 'rspec/rspec-expectations'
  gem 'rspec-mocks', github: 'rspec/rspec-mocks'
  gem 'rails-controller-testing'
  gem 'factory_girl_rails', '~> 4.5.0'

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
end

group :development do
  gem 'web-console', '~> 3.0'
  gem 'pry-byebug'
  gem 'spring'
  gem 'quiet_assets'
end
