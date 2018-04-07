set :application, 'capistrano-sample'
set :repo_url, 'https://github.com/Mikroways/mikroways.net.git'
set :deploy_to, '/opt/sites/jekyll'
set :branch, 'v1.0.0'
set :rbenv_type, :user
set :rbenv_ruby, '2.3.0'
set :rbenv_roles, :app
set :bundle_roles, :app
