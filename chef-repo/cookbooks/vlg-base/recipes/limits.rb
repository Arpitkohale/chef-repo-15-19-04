#
# Cookbook Name:: vlg-base
# Recipe:: limits
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

vlg_app_user_limits = [{ 'domain' => "#{node['vlg-base']['app_user']}",
                    'type'   => 'soft',
                    'item' => 'nofile',
                    'value' => '65536' },
		{ 'domain' => "#{node['vlg-base']['app_user']}",
                    'type'   => 'hard',
                    'item' => 'nofile',
                    'value' => '65536' },
                { 'domain' => "#{node['vlg-base']['app_user']}",
                    'type'   => 'soft',
                    'item' => 'nproc',
                    'value' => '65536' },
                { 'domain' => "#{node['vlg-base']['app_user']}",
                    'type'   => 'hard',
                    'item' => 'nproc',
                    'value' => '65536' },
               { 'domain' => "#{node['vlg-base']['app_user']}",
                    'type'   => 'soft',
                    'item' => 'core',
                    'value' => 'unlimited' },
               { 'domain' => "#{node['vlg-base']['app_user']}",
                    'type'   => 'hard',
                    'item' => 'core',
                    'value' => 'unlimited' }]

limits_config "configure #{node['vlg-base']['app_user']} limits" do
  limits vlg_app_user_limits
  system true
  action :create
end 
