directory node['vlg-pd2jira']['base_dir'] do
  recursive true
  action :create
  mode 0755
  owner node['vlg-pd2jira']['owner']
  group node['vlg-pd2jira']['group']
end

cookbook_file '/var/www/pd2jira' do
  source 'pd2jira.php'
  owner node['vlg-pd2jira']['owner']
  group node['vlg-pd2jira']['group']
  mode '0755'
  action :create
end

template "/var/www/pd2jira" do
  source 'var.php.erb'
  mode "755"
  owner node['vlg-pd2jira']['owner']
  group node['vlg-pd2jira']['group']
  action :create
end
