# solr5
default['vlg-solr5']['version'] = '5.2.1'
default['vlg-solr5']['download_url'] = "https://s3.amazonaws.com/videologypublic/repo/solr-#{node['vlg-solr5']['version']}.tgz"
default['vlg-solr5']['user'] = "#{node['vlg-base']['app_user']}"
default['vlg-solr5']['group'] = "#{node['vlg-base']['app_user']}"
default['vlg-solr5']['install_dir'] = "/home/#{node['vlg-solr5']['user']}"
default['vlg-solr5']['home_dir'] = "#{node['vlg-solr5']['install_dir']}/solr"
default['vlg-solr5']['env_dir'] = "/var/solr"
default['vlg-solr5']['solr_heap'] = '2g'
