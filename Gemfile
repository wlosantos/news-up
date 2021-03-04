source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'rails', '~> 6.1.1'
gem 'puma', '~> 5.0'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 5.0'
gem 'jbuilder', '~> 2.7'

gem 'haml'
gem 'haml-rails'
# gem 'devise'
#gem 'devise-i18n', '~> 1.9', '>= 1.9.2'
# gem 'rails-i18n'

# gem "acts-as-taggable-on", "~> 7.0"
# gem "active_storage_validations", "~> 0.9.2"
# gem "mini_magick"
# gem 'image_processing', '~>1.2'


gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'sqlite3', '~> 1.4'
  gem 'rspec-rails'
  gem 'better_errors','>= 2.7.1'
  gem 'faker'
  gem 'awesome_print'
  gem 'factory_bot_rails'
end

group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  gem 'spring'
end

group :production do
  gem 'pg'
end
