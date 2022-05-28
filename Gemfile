source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.4'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.7'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
gem 'redis-namespace', '~> 1.8', '>= 1.8.1'
gem 'redis-rails', '~> 5.0', '>= 5.0.2'
# Simple, efficient background processing for Ruby.
gem 'sidekiq', '~> 6.4', '>= 6.4.1'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Better than fixtures, building factories for data simulation
  gem 'factory_bot_rails', '~> 6.2.0'
  # Easy and Fast way to making Fake Test Data.
  gem 'ffaker', '~> 2.20'
  # Giving byebug the Pry Capabilities.
  gem 'pry-byebug', '~> 3.9.0'
  # Main Testing Framework.
  gem 'rspec-rails', '~> 5.1.1'
end

group :development do
  # Annotating Model Schema inside model file.
  gem 'annotate', '~> 3.2.0'
  # Flay analyzes code for structural similarities.
  gem 'flay', '2.13.0'
  # The Listen gem listens to file modifications and notifies you about the changes.
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Keeping with ROR best practices.
  gem 'overcommit', '0.58.0'
  # A code metric tool for rails codes.
  gem 'rails_best_practices', '1.23.1'
  # RuboCop is a Ruby code style checking and code formatting tool.
  gem 'rubocop', '~> 1.30', require: false
  # A collection of RuboCop cops to check for performance optimizations in Ruby code.
  gem 'rubocop-performance', '~> 1.12', require: false
  # A RuboCop extension focused on enforcing Rails best practices and coding conventions.
  gem 'rubocop-rails', '~> 2.12', require: false
end

group :test do
  # Cleaning Database before, after and during tests.
  gem 'database_cleaner-active_record', '~> 2.0.1'
  # Requirement for Shoulda.
  gem 'rails-controller-testing', '~> 1.0', '>= 1.0.5'
  # Easy mock and stub of model.
  gem 'rspec-activemodel-mocks', '~> 1.1'
  # Faster testing code with shoulda helpers.
  gem 'shoulda-matchers', '~> 5.1'
  # Analysing Coverage done for code testing.
  gem 'simplecov', '~> 0.21.2', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
# Centralization of locale data collection for Ruby on Rails.
gem 'rails-i18n', '~> 5.1', '>= 5.1.3'
# Devise is a flexible authentication solution for Rails.
gem 'devise', '~> 4.8', '>= 4.8.1'
# Localization for devise
gem 'devise-i18n', '~> 1.10.1'
# Generic state machine library
gem 'aasm', '5.2.0'
