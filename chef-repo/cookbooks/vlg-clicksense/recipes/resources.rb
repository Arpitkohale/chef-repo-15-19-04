#
# Cookbook Name:: vlg-clicksense
# Recipe:: resources
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

# download the lucidmedia-resources jar and make sure the md5sum matches
bash "download_clicksense_resource_file" do
  user node['vlg-base']['app_user']
  not_if "md5sum #{node['vlg-clicksense']['lib_dir']}/#{node['vlg-clicksense']['resources']['filename']} | grep -q 2ac9a94174603ef45f2569f9a747ba69"
  cwd node['vlg-clicksense']['lib_dir']
  code <<-EOH
    s3cmd -c #{node['vlg-base']['app_user_home']}/.s3cfg get "#{node['vlg-clicksense']['resources']['s3']['url']}"
  EOH
end
