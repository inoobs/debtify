# Puma can serve each request in a thread from an internal thread pool.
# The `threads` method setting takes two numbers a minimum and maximum.
# Any libraries that use thread pools should be configured to match
# the maximum value specified for Puma. Default is set to 5 threads for minimum
# and maximum, this matches the default thread size of Active Record.
#
app_dir = File.expand_path("../..", __FILE__)
shared_dir = "#{app_dir}/../../shared"

require "dotenv"
Dotenv.load("#{shared_dir}/.env")

# Change to match your CPU core count
# grep -c processor /proc/cpuinfo
workers 2

# Min and Max threads per worker
threads 1, 16

rails_env = ENV['RAILS_ENV'] || "development"
environment rails_env

# Set up socket location
bind "unix://#{shared_dir}/tmp/sockets/puma.sock"

# Logging
stdout_redirect "#{shared_dir}/log/puma.stdout.log", "#{shared_dir}/log/puma.stderr.log", true

# Set master PID and state locations
pidfile "#{shared_dir}/tmp/pids/puma.pid"
state_path "#{shared_dir}/tmp/pids/puma.state"
activate_control_app

