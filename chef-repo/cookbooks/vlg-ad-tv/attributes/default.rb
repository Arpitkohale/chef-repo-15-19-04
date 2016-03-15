# vg-use-e2e-03 redshift public ssh key
default['vlg-base']['vlg']['ssh']['authorized_keys'] = node['vlg-base']['vlg']['ssh']['authorized_keys'] + [ 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCFmUFmqSRiJyTvJzyyCTnlxqvfcSX8mQkfB6/+F7EM5dKELhBPmsGdVF7zEvrBydU+69hmUcM2PQKvpYKPlpUaiF9IsBfs1brlEQM809PjpvzBbtXFxbsVTISI2WMbk65Xg0yKltR97BPYiYIV/3N/yq9hVWwclvvUeFOAfO5zw7z8fGox50A8AawXSVI1X9WM5VMAKLa27juzMj/f4y//v/C82o+xRAPJjViUufipJnO34tDoL0U5pff8qeCKTgUSwdv6ZbOEnT1plDiRpdD8Kf9uWEbxAwL5cIII9PQiH4NJgfpYTtLAcP5DkAM8kPuao3ax0KcYX9M2/nbsbp9F Amazon-Redshift' ]

# sudo
case node.chef_environment
when "production"
  default['authorization']['sudo']['groups'] = node['authorization']['sudo']['groups'] + [ 'appdev' ]
when "endtoend"
  default['authorization']['sudo']['groups'] = node['authorization']['sudo']['groups'] + [ 'appdev' ]
when "sandbox"
  default['authorization']['sudo']['groups'] = node['authorization']['sudo']['groups'] + [ 'appdev' ]
end

# repo
default['vlg-ad-tv']['tv-nielsen-data'] = "#{node['vlg-base']['app_user_home']}/nielsenIngest/codebase/tv-nielsen-data"
default['vlg-ad-tv']['tv-db-redshift_sync'] = "#{node['vlg-base']['app_user_home']}/nielsenIngest/codebase/tv-db-redshift_sync"
