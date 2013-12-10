source 'https://rubygems.org'
#ruby '2.0.0'
#ruby-gemset=railstutorial_rails_4_0

gem 'rails', '~>4.0.0'
gem 'bootstrap-sass', '~>2.3.2.0'
gem 'bcrypt-ruby', '~>3.1.2'
gem 'faker', '1.1.2'
gem 'will_paginate', '3.0.4'
gem 'bootstrap-will_paginate', '0.0.9'
gem 'paperclip', '~> 3.0'
#gem 'rails-i18n', '~> 4.0.0'
gem "rails_best_practices", "~> 1.14.4"


group :development, :test do
        gem 'sqlite3', '~>1.3.7'
        gem 'rspec-rails', '~>2.13.1'
        gem 'guard-rspec', '~>2.5.0'
        #gem 'growl', '~>1.0.3'
        gem 'spork-rails', git: 'https://github.com/sporkrb/spork-rails.git'
        gem 'guard-spork', '~>1.5.0'
        gem 'childprocess', '~>0.3.6'
end

group :test do
        gem 'selenium-webdriver', '~>2.35.1'
        gem 'capybara', '~>2.1.0'
        gem 'factory_girl_rails', '~>4.2.1'
        gem 'cucumber-rails', '1.4.0', :require => false
        gem 'database_cleaner', git: 'https://github.com/bmabey/database_cleaner.git'
        gem "simplecov", "~> 0.8.2"

end

gem 'sass-rails', '~>4.0.0'
gem 'uglifier', '~>2.1.1'
gem 'coffee-rails', '~>4.0.0'
gem 'jquery-rails', '~>3.0.4'
gem 'turbolinks', '~>1.1.1'
gem 'jbuilder', '~>1.0.2'


group :doc do
        gem 'sdoc', '~>0.3.20', require: false
end

group :production do
        gem 'pg', '~>0.15.1'
        gem 'rails_12factor', '~>0.0.2'
end
gem 'unicorn'

gem 'capistrano', '~> 3.0', group: :development
gem 'capistrano-rails', group: :development
gem 'capistrano-bundler', group: :development
gem 'capistrano-rvm', '~> 0.0.3', group: :development