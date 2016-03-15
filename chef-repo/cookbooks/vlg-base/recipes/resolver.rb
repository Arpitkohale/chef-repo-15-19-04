#
# Cookbook Name:: vlg-base
# Recipe:: resolver
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

# This is bad... It's a hack. I really need to find a better way to determine if a node is part of a VPC.
# -jp

# If the node is in a VPC, touch the 'aws-vpc' file
bash "get_aws_vpc" do
  code <<-EOH
  mac_address=$(/usr/bin/timeout 1 /usr/bin/curl --stderr /dev/null --connect-timeout 1 http://169.254.169.254/latest/meta-data/mac | head -1)
  if [ "$mac_address" != "" ]
  then
    vpc_id_count=$(/usr/bin/timeout 1 /usr/bin/curl --stderr /dev/null --connect-timeout 1 http://169.254.169.254/latest/meta-data/network/interfaces/macs/$mac_address/vpc-id | grep -c vpc)
  fi
  if [ "$vpc_id_count" -gt "0" ]
  then
    touch #{Chef::Config[:file_cache_path]}/aws-vpc
  fi
  EOH
  ignore_failure true
end

# If the 'aws-vpc' file exists, set the proper resolver attributes
if File.exist?("#{Chef::Config[:file_cache_path]}/aws-vpc")
  node.default['resolver']['nameservers'] = [ '169.254.169.253' ]
  node.default['resolver']['search'] = "inf.videologygroup.com"
end

# Call the resolver recipe
include_recipe "resolver::default"
