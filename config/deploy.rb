# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'eMarket'
set :repo_url, 'git@github.com:DenisRebenok/emarket.git'

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/home/deployer/emarket'
set :deploy_user, 'deployer'

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml', '.env')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/system')

set :rvm1_map_bins, fetch(:rvm1_map_bins).to_a.concat(%w(sidekiq sidekiqctl))

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wailt: 5 do
      # Your restart mechanism here, for exmple:
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart
end
