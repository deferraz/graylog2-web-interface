rails_env = ENV['RAILS_ENV'] || 'test'
worker_processes 4
timeout 30
listen 3000
pid "tmp/pids/unicorn.pid"