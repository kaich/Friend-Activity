source 'https://rubygems.org'
#source 'https://ruby.taobao.org'



# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails' , '~> 5.1.5'
# Use sqlite3 as the database for Active Record
gem 'sqlite3' , :group => :development


gem 'mysql2', :group => :production

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0.1'
#bootstrap
gem 'bootstrap-sass', '~> 3.3.5.1'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

#authentication solution for Rails 
gem 'devise'

#simple form 
#gem 'simple_form', '~> 3.1.0.rc1', github: 'plataformatec/simple_form', branch: 'master'

#font awesome
gem 'font-awesome-sass'

#markdown 
gem 'redcarpet'
gem 'coderay'

#will paginate
gem 'will_paginate', '~> 3.0.6'
gem 'will_paginate-bootstrap'

#bootstrap3-datetimepicker
gem 'momentjs-rails', '>= 2.9.0'
gem 'bootstrap3-datetimepicker-rails', '~> 4.15.35'

#notification
gem "gritter", "1.2.0"

#图片上传
gem 'carrierwave'
gem 'carrierwave-qiniu'
gem 'qiniu', '~> 6.2.1'
gem 'mini_magick', '3.7.0', require: false

#投票
gem 'acts_as_votable', '~> 0.10.0'

#图表
gem 'lazy_high_charts'

#通知
gem 'message_bus'

#字典数据库
gem 'redis', '~>3.2'
gem "hiredis", "~> 0.4.5"

#前端包管理rails-assets （部署时候服务器崩溃)
#source 'https://rails-assets.org' do
  #gem 'rails-assets-bootstrap-markdown'
  #gem 'rails-assets-markdown-js'
  #gem 'rails-assets-marked'
  #gem 'rails-assets-to-markdown'
#end

#前端包管理bower-rails
gem "bower-rails", "~> 0.10.0"

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
group :development , :test do 
  gem 'byebug'
  #Spring is a Rails application preloader.
  gem "spring"
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  # generates fake data
  gem 'faker'

  # deploy 
  gem 'capistrano'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'capistrano-rails-console' 
  gem 'capistrano3-puma', require: false 
end
# gem 'debugger', group: [:development, :test]

