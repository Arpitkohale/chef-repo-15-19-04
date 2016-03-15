# maven
data = Chef::EncryptedDataBagItem.load("maven", "credentials")
maven_login = data["login"]
maven_password = data["password"]
default['vlg-all-in-one']['maven']['login'] = "#{maven_login}"
default['vlg-all-in-one']['maven']['password'] = "#{maven_password}"

# mysql
data = Chef::EncryptedDataBagItem.load("bamboo-agent", "mysql")
default['vlg-all-in-one']['mysql_root_password'] = data["root-password"]

# bamboo
default['vlg-bamboo-server']['url'] = 'http://bamboo.gio.videologygroup.com'
default['vlg-bamboo-agent']['home'] = "/data/bamboo-agent-home"
default['vlg-bamboo-agent']['installer']['file'] = 'atlassian-bamboo-agent-installer-5.7.1.jar'
default['vlg-bamboo-agent']['installer']['url'] = "#{node['vlg-bamboo-server']['url']}/agentServer/agentInstaller/#{node['vlg-bamboo-agent']['installer']['file']}"

# dmp repo
default['vlg-bamboo-agent']['dmp_repo_dir'] = '/data/dmp-repo'

# solr
default['vlg-all-in-one']['solr']['config_dir'] = "#{node['vlg-bamboo-agent']['dmp_repo_dir']}/dmp-jobs/dmp-jobs-core/src/main/resources"

#haproxy
default['vlg-haproxy']['stats_port'] = "8163"

# swap
case node.chef_environment
when "production"
  default['vlg-swap']['size'] = 65536
when "endtoend"
  default['vlg-swap']['size'] = 65536
when "staging"
  default['vlg-swap']['size'] = 65536
when "sandbox"
  default['vlg-swap']['size'] = 65536
end
