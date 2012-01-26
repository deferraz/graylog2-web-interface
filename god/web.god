# load in all god configs

@rails_env         = ENV['RAILS_ENV']  || "production"
@rails_root        = ENV['RAILS_ROOT'] || "/var/www/graylog2-web"
@conf_dir          = File.dirname(__FILE__)
@server_deployment = ENV['LOCAL_DEPLOYMENT'] ? false : (["production"].member?(@rails_env))
@log_root          = @server_deployment ? "/var/log/graylog2-web" : "#{@rails_root}/log"
@pids_root         = "#{@rails_root}/tmp/pids"

puts <<-GOD
            god configuration:
            RAILS_ENV  : #{@rails_env}
            RAILS_ROOT : #{@rails_root}
            conf_dir   : #{@conf_dir}
            log_root   : #{@log_root}
            pids_root  : #{@pids_root}
            server_mode: #{@server_deployment.inspect}
        GOD

require 'god'
God.terminate_timeout = 60
God.pid_file_directory = @pids_root

God.load File.join(@conf_dir, "unicorn.god") 
