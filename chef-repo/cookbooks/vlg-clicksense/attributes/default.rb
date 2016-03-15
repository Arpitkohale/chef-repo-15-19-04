# dirs
default['vlg-clicksense']['home_dir'] = "#{node['vlg-base']['app_user_home']}/ClickSense"
default['vlg-clicksense']['local_dir'] = "#{node['vlg-clicksense']['home_dir']}/local"
default['vlg-clicksense']['lib_dir'] = "#{node['vlg-clicksense']['home_dir']}/lib"

# resources jar
default['vlg-clicksense']['resources']['filename'] = 'lucidmedia-resources-4.14.21.jar'
default['vlg-clicksense']['resources']['s3']['url'] = "s3://vg-gio/clicksense/#{node['vlg-clicksense']['resources']['filename']}"
default['vlg-clicksense']['resources']['jar']['path'] = "#{node['vlg-clicksense']['lib_dir']}/#{node['vlg-clicksense']['resources']['filename']}"
