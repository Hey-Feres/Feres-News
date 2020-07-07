root = "/var/www/feres_news/current"
working_directory root
pid "#{root}/tmp/pids/unicorn.pid"
stderr_path "#{root}/log/unicorn.log" 
stdout_path "#{root}/log/unicorn.log"
worker_processes 4 
timeout 30 
preload_app true
listen '/tmp/feres_news.sock', backlog: 64