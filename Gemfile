source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.1'

# Use mysql as the database for Active Record
gem 'mysql2'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# ********************# ********************# ********************
gem 'haml'
gem 'haml-rails'
#gem 'haml_coffee_assets'
# gem 'sass-rails',
gem 'compass-rails', github: 'Compass/compass-rails', branch: 'rails4-hack'

gem 'carrierwave'
gem "mini_magick"
gem 'redcarpet'
gem 'state_machine'
gem 'activeadmin', github: 'gregbell/active_admin'
gem 'ckeditor', github: 'galetahub/ckeditor'
gem "activeadmin-sortable-tree", :github => "nebirhos/activeadmin-sortable-tree", :branch => "master"
# ********************# ********************# ********************

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
group :development do
  # gem "rvm-capistrano"
  # gem "capistrano", :require => false
  # gem 'capistrano-rails'
  # gem 'capistrano-rvm'
  # gem "capistrano-notifier"
  # gem 'capistrano-unicorn', :require => false


  gem "capistrano", "2.15.5"
  gem "capistrano-ext", "1.2.1"
  # gecapistrano-notifier (0.2.2)
  #     capistrano (>= 2)
  gem "capistrano_colors", "0.5.5"
  gem "rvm-capistrano", "1.5.1"

end
gem "therubyracer"

# Use debugger
# gem 'debugger', group: [:development, :test]

group :production do
  gem "unicorn"
end
