set :application, "effectif.com"
set :repository, "git://github.com/gma/effectif.com.git"
set :domain, "fig.effectif.com"
set :deploy_to, "/var/apps/#{application}"

# ============================================================================
# You don't need to worry about anything beneath this point...
# ============================================================================

require "tempfile"
require "vlad"

namespace :vlad do
  remote_task :symlink_attachments do
    run "ln -s #{shared_path}/content/attachments #{current_path}/public/attachments"
  end
  
  task :update do
    Rake::Task["vlad:symlink_attachments"].invoke
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
