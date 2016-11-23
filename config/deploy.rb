# config valid only for current version of Capistrano
lock '3.6.1'

set :application, 'rorlogin'
set :repo_url, 'git@github.com:delatorremario/ror-api-login-seed.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

set :ssh_options,{
    keys:["#{ENV['HOME']}/.ssh/rails-dev.pem"],
    forward_agent:true,
    auth_methods:["publickey"]
}

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/var/www/my_app_name'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, 'config/database.yml', 'config/secrets.yml'

# Default value for linked_dirs is []
# append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system'

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

set :bundle_roles, :all                                  # this is default
set :bundle_binstubs, nil     # Rails 4 generates executables
set :bundle_gemfile, -> { release_path.join('Gemfile') } # default: nil
set :bundle_path, -> { shared_path.join('bundle') }      # this is default
set :bundle_without, %w{development test}.join(' ')      # this is default
set :bundle_flags, '--deployment --quiet'                # this is default
set :bundle_env_variables, {}                    # this is default

set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

set :keep_releases, 5

set :rbenv_type, :user
set :rbenv_ruby, '2.3.1'
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} /home/ubuntu/.rbenv/bin/rbenv exec"
# set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all
set :rbenv_custom_path, '/home/ubuntu/.rbenv/bin/rbenv'
set :rbenv_map_bins, %w(rake gem bundle ruby rails sidekiq sidekiqctl)

namespace :deploy do

 after :restart, :clear_cache do
   on roles(:web), in: :groups, limit: 3, wait: 10 do
     # Here we can do anything such as:
     # within release_path do
     #   execute :rake, 'cache:clear'
     # end
   end
 end

end