source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "rails", "~> 7.0.3"

gem "devise", "~> 4.8"

gem 'bootstrap', '~> 5.1.3'
gem 'bootstrap-icons-helper'
gem "sassc-rails"
gem 'autoprefixer-rails'

gem 'carrierwave'
gem 'rmagick'

gem 'dotenv-rails'

gem 'image_processing'
gem 'mini_magick'
gem 'sprockets-rails'

gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "redis", "~> 4.0"
gem "bootsnap", require: false

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'sqlite3'
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end

group :production do
  gem 'pg'
end
