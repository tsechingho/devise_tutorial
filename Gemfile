source 'http://rubygems.org'

gem 'rails', '3.0.10'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# +Databases
gem 'pg', :group => :production # for heroku
gem 'mysql2', '~> 0.2.11', :group => [:development, :test]

# Use unicorn as the web server
gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
# gem 'ruby-debug'
# gem 'ruby-debug19', :require => 'ruby-debug'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

## Toolkit
gem 'jquery-rails'
gem 'simple_form'
gem 'will_paginate', '~> 3.0'
gem 'responders'
gem 'paperclip'
gem 'stringex'

## Authentication
gem 'bcrypt-ruby', :require => 'bcrypt'
gem 'warden'
gem 'devise', '~> 1.4.2'
gem 'oa-oauth', :require => 'omniauth/oauth'
gem 'oa-openid', :require => 'omniauth/openid'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
# group :development, :test do
#   gem 'webrat'
# end

## Console tools
gem 'wirble', :group => :development
gem 'hirb', :group => :development

## Testing
group :development, :test do
  gem 'rspec-rails', '~> 2.6.0'
end
