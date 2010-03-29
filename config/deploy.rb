set :application, "proto-subscription"
set :user, "root"
set :domain, '208.88.125.46'
set :server_hostname, '208.88.125.46'

set :git_account, 'gillesmathurin'

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :app, server_hostname
role :web, server_hostname
role :db, server_hostname, :primary => true

default_run_options[:pty] = true
set :repository, "git@github.com:#{git_account}/#{application}.git"
set :scm, "git"
set :user, user

ssh_options[:forward_agent] = true
set :branch, 'master'
set :deploy_via, :remote_cache
set :git_shallow_clone, 1
set :git_enable_submodules, 1
set :use_sudo, false
set :deploy_to, "/var/rails/protosubscription"

namespace :deploy do
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{File.join(current_path, 'tmp', 'restart.txt')}"
  end
  
  # task :finishing_touches, :roles => :app do
  #   run "cp -pf /var/rails/protosubscription/to_copy/database.yml #{current_path}/config/database.yml"
  # end
  
  # task :set_to_wwwdata_user, :roles => :app do
  #   run "chown -R www-data:root #{current_path}/log/production.log"
  # end
  
  # task :load_seeds_data, :role => :app do
  #   run "cd #{current_path} && rake db:create RAILS_ENV=production"
  # end
  
  after 'deploy:symlink'
  #, 'deploy:set_to_wwwdata_user'
end

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end