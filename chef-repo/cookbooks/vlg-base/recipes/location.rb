#
# Cookbook Name:: vlg-base
# Recipe:: location
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

# If we could not figure out where this box is we throw an error
if node['vlg-base']['location'] == ''
  log 'location' do
    level :error
    message 'Could not find location. Is this a new datacenter?'
  end
end
