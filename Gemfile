source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'coffee-rails', '~> 4.2'
gem 'sass-rails', '~> 5.0'
gem 'jbuilder', '~> 2.5'
gem 'uglifier', '>= 1.3.0'
gem 'rails', '~> 5.1.7'
gem 'puma', '~> 3.7'
gem 'pg', '>= 0.18', '< 2.0'

group :development, :test do
  gem 'shoulda-matchers'
  gem 'rspec-rails'
  gem 'simplecov'
  gem 'capybara'
  gem 'launchy'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
