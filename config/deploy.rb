set :application, "nesta"
set :repository, "git://github.com/gma/nesta.git"
set :revision, "origin/effectif"
set :domain, "fig.effectif.com"
set :deploy_to, "/var/apps/#{application}"

# ============================================================================
# You don't need to worry about anything beneath this point...
# ============================================================================

require "tempfile"
require "vlad"

namespace :vlad do
  remote_task :config_yml do
    put "#{shared_path}/config.yml", "vlad.config.yml" do
      File.open(File.join(File.dirname(__FILE__), "config.yml")).read
    end
  end
  
  task :setup do
    Rake::Task['vlad:config_yml'].invoke
  end
  
  remote_task :symlink_config_yml do
    run "ln -s #{shared_path}/config.yml #{current_path}/config/config.yml"
  end
  
  remote_task :symlink_attachments do
    run "ln -s #{shared_path}/content/attachments #{current_path}/public/attachments"
  end
  
  task :update do
    [:symlink_config_yml, :symlink_attachments].each do |task|
      Rake::Task["vlad:#{task}"].invoke
    end
  end
  
  # If you use bundler to manage the installation of gems on your server
  # you can uncomment this task (and the corresponding definition of the
  # deploy task below).
  #
  remote_task :bundle do
    run "cd #{current_path} && sudo /opt/ruby/bin/bundle install --without development test"
  end
  
  desc "Deploy the code and restart the server"
  # task :deploy => [:update, :start_app]
  task :deploy => [:update, :bundle, :start_app]
end
