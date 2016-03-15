# solr

directory node['vlg-all-in-one']['solr']['config_dir'] do
  owner node['vlg-base']['app_user']
  group node['vlg-base']['app_user']
  mode "0755"
  action :create
end

bash 'setup_solr' do
  code <<-EOH
    curl -s -f -o #{node['vlg-all-in-one']['solr']['config_dir']}/dmp-jobs-core.jar "http://nexus.videologygroup.com/nexus/service/local/artifact/maven/content?r=snapshots&g=com.lucidmedia&a=dmp-jobs-core&v=LATEST&e=jar"
    cd #{node['vlg-all-in-one']['solr']['config_dir']}
    unzip -o dmp-jobs-core.jar
  EOH
end
