#
# Cookbook Name:: vlg-data-normalizer
# Recipe:: links
#
# Copyright 2015, Videology Group, Inc
#
# All rights reserved - Do Not Redistribute
#

link "#{node['vlg-base']['app_user_home']}/app-fte-normalizer/config" do
  to "#{node['vlg-base']['app_user_home']}/app-fte-normalizer/transformer/src/main/resources/prod"
  only_if "test -d #{node['vlg-base']['app_user_home']}/app-fte-normalizer/transformer/src/main/resources/prod"
end

users = data_bag('data-providers')
users.each do |id|
  link "/home/#{id}" do
    to "#{node['vlg-data-normalizer']['provider_root']}/#{id}"
    only_if "test -d #{node['vlg-data-normalizer']['provider_root']}/#{id}"
  end
end
