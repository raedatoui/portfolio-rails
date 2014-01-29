role :app, "raedatoui.com"
set :roles, %w{web app}
set :deploy_to, "/srv/www/raedatoui.com/app/"
set :scm_command, '/usr/bin/git'
set :user, "deploy"
set :scm_passphrase, '3ntiss@r'
default_run_options[:pty] = true

