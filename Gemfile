source 'https://rubygems.org'


# Rails, MySQL, Puma
gem 'rails', '~> 5.2.0'
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
gem 'puma', '~> 3.11'

# Rails Dependencies
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

# loads rails apps faster 
gem 'bootsnap', '>= 1.1.0', require: false

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

gem 'acts_as_list', '~> 0.7.6'

gem 'mime-types'
gem 'mini_magick'
gem 'rmagick'
gem 'carrierwave', '~> 1.3'
gem 'carrierwave-video'
gem 'carrierwave-video-thumbnailer'
gem 'carrierwave-ffmpeg'

# WYSIWYG Editor for rails
# gem 'wysiwyg-rails'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# frontend
gem 'font-awesome-sass'

# TEST ONLY GEMS
group :test  do
  gem 'simplecov'
  gem 'simplecov-shield'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  gem 'listen', '~> 3.0.5'
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
