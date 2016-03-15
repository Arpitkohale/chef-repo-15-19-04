#
# Cookbook Name:: vlg-lz-kz
# Recipe:: default
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#
case node.chef_environment
	when "production"
		include_recipe "vlg-lz-kz::nrpe_checks"
		include_recipe "vlg-lz-kz::dirs"
		include_recipe "vlg-zookeeper::default"
		include_recipe "vlg-kafka::default"
	when "staging"
		include_recipe "vlg-lz-kz::dirs"
		include_recipe "vlg-zookeeper::default"
		include_recipe "vlg-kafka::default"
	when "sandbox"
		include_recipe "vlg-lz-kz::dirs"
		include_recipe "vlg-zookeeper::default"
		include_recipe "vlg-kafka::default"
	else #vagrant
		include_recipe "vlg-lz-kz::dirs"
		include_recipe "vlg-zookeeper::default"
		include_recipe "vlg-kafka::default"
end
