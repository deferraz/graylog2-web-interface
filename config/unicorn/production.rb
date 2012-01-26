rails_env = ENV['RAILS_ENV'] || 'production'
worker_processes 16
timeout 30
listen "127.0.0.1:11100"
pid "tmp/pids/unicorn.pid"
