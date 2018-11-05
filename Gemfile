source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.10'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
# gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'dotenv-rails'

# gem 'autoprefixer-rails'
gem 'normalize-rails', '~> 3.0.0'
gem 'lograge', '~> 0.3.5'
gem 'optimadmin', git: 'git@github.com:eskimosoup/Optimadmin.git', branch: :master
gem 'cookie_consent', git: 'git@github.com:eskimosoup/cookie_consent.git', branch: :master
gem 'friendly_id', '~> 5.1'
gem 'geocoder', '~> 1.3', '>= 1.3.4'
gem 'twitter'
gem 'simple_form', '~> 3.2', '>= 3.2.1'
gem 'cocoon', '~> 1.2', '>= 1.2.9'
gem 'bcrypt'

gem 'gibbon'
gem 'whenever', require: false
gem 'thin'

gem 'capistrano'
gem 'capistrano-rails'
gem 'capistrano-rbenv'
gem 'capistrano-passenger'
gem 'pg_search'
gem 'pdfkit'
gem 'render_anywhere'
gem 'fog-aws'

group :development do
  gem 'optimadmin_generators', git: 'git@github.com:eskimosoup/optimadmin_generators.git'
  gem 'puma'
  gem 'quiet_assets'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'web-console'
  gem 'rack-mini-profiler'
  gem 'letter_opener'
  gem 'annotate'
end

group :development, :test do
  gem 'awesome_print'
  gem 'bullet'
  gem 'bundler-audit', '>= 0.5.0', require: false
  gem 'factory_girl_rails'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 3.4.0'
end

group :test do
  gem 'email_spec', '~> 2.1'
  # gem 'capybara-webkit'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'shoulda-matchers'
  gem 'shoulda-callback-matchers'
  gem 'simplecov', require: false
end
