# config valid only for current version of Capistrano
lock '3.4.0'
set :applicaion, 'debtify'
set :repo_url, "git@github.com:inoobs/debtify.git"
set :tmp_dir, "/home/deploy/tmp"
set :assets_roles, [:app]

# Default value for :scm is :git
set :scm, :git

# Default value for :linked_files is []
set :linked_files, %w{config/database.yml config/application.yml}

# Default value for linked_dirs is []
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for keep_releases is 5
set :keep_releases, 5

# which config files should be copied by deploy:setup_config
# see documentation in lib/capistrano/tasks/setup_config.cap
# for details of operations
set(:config_files, %w(
  nginx.conf
  application.yml
  database.yml
))

# files which need to be symlinked to other parts of the
# filesystem. For example nginx virtualhosts, log rotation
# init scripts etc. The full_app_name variable isn't
# available at this point so we use a custom template {{}}
# tag and then add it at run time.
set(:symlinks, [
  {
    source: "nginx.conf",
    link: "/etc/nginx/conf.d/{{full_app_name}}"
  }
])

namespace :deploy do
  after :publishing, :restart
  # compile assets locally then rsync
  after :finishing, 'deploy:cleanup'
end
