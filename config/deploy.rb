$:.unshift(File.expand_path('./lib', ENV['rvm_path'])) 
require "rvm/capistrano" 
require "bundler/capistrano"

set :rvm_ruby_string, "ruby-2.0.0-p576@made4two" 
set :rvm_type, :user
set :use_sudo, false
default_run_options[:pty] = true 
ssh_options[:forward_agent] = true

set :application, "Made4Two"
set :repository,  "git@github.com:umerfarooq/made4two.git"
set :scm, :git 
set :user, "ec2-user"
set :branch, "master"
set :deploy_via, :remote_cache
set :deploy_to, "/var/rails/apps/made4two" 
set :rails_env, :production

role :web, "54.69.139.255"                          # Your HTTP server, Apache/etc
role :app, "54.69.139.255"                          # This may be the same as your `Web` server
role :db,  "54.69.139.255", :primary => true # This is where Rails migrations will run

after "deploy:update_code", "deploy:update_shared_symlinks" 
# after "deploy:update_shared_symlinks", "deploy:migrate"

after "deploy:migrations", "deploy:seed"
after :deploy, "deploy:seed"

namespace :deploy do 
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  task :update_shared_symlinks do 
    %w(config/database.yml).each do |path| 
      # run "rm -rf #{File.join(release_path, path)}" 
      run "ln -s #{File.join(deploy_to, "shared", path)} #{File.join(release_path, path)}" 
    end 
  end 

  desc "reload the database with seed data"
  task :seed do
    run "cd #{current_path}; bundle exec rake db:seed RAILS_ENV=#{rails_env}"
  end
end 

# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"