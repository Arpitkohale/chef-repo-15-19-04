#
# Cookbook Name:: vlg-lz-kf
# Recipe:: default
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#
case node.chef_environment
	when "production"
		include_recipe "vlg-lz-kf::monitoring"
		include_recipe "vlg-lz-kf::dirs"
		include_recipe "vlg-kafka::default"
	when "staging"
		include_recipe "vlg-lz-kf::monitoring"
		include_recipe "vlg-lz-kf::dirs"
		include_recipe "vlg-kafka::default"
	when "sandbox"
		include_recipe "vlg-lz-kf::dirs"
		include_recipe "vlg-kafka::default"
	else #vagrant
		include_recipe "vlg-lz-kf::dirs"
		include_recipe "vlg-kafka::default"
end
