set :branch, 'master'
set :rails_env, 'production'
server '46.101.180.240', user: 'deployer', roles: %w{web app db}
