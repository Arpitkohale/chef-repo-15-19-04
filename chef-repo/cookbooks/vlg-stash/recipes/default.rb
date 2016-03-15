if node['platform_family'] == 'rhel' && node['platform_version'].to_f < 7
  include_recipe 'git::source'
else
  include_recipe 'git'
end
include_recipe 'perl'

include_recipe "stash::#{platform}_#{node['stash']['install_type']}"