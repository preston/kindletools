require 'rvm/capistrano'
require "bundler/capistrano"

set :rvm_type,              :system
set :rvm_ruby_string,       "ruby-2.0.0"
set :rvm_path,              "/usr/local/rvm"


set :application, "kindletools"
set :domain,      "kindletools.prestonlee.com"
#set :repository,  "ssh://#{domain}/var/git/#{application}"
set	:repository,	"git@github.com:preston/kindletools.git"
set :use_sudo,    false
set :deploy_to,   "/var/www/#{domain}"
set :deploy_via, 'copy'
set :scm,         "git"
# set :scm_username,		"www-data"
set :user,			"www-data"

role :app, domain
role :web, domain
role :db,  domain, :primary => true


after "deploy", "deploy:migrate"
after "deploy:migrate", 'deploy:cleanup'


namespace :deploy do
  task :start, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end

  task :stop, :roles => :app do
    # Do nothing.
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end
end


namespace :config do
 
  desc "Add server-only shared directories."
  task :setup, :roles => [:app] do
  	run "mkdir -p #{shared_path}/config"
    run "mkdir -p #{shared_path}/db"
  end
  after "deploy:setup", "config:setup"
  
  desc "Update server-only config files to new deployment directory."
  task :update, :roles => [:app] do
    run "cp -Rfv #{shared_path}/config #{release_path}"
  end
  after "deploy:update_code", "config:update"
 
  # desc "Update shared server database symlink for new deployment."
  # task :database, :roles => [:app] do
  #   run "ln -s #{shared_path}/db/production.sqlite3 #{release_path}/db/production.sqlite3"
  # end
  # after "deploy:update_code", "config:update"

end