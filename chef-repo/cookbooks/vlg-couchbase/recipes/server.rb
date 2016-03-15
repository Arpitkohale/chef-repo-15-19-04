#
# Cookbook Name:: vlg-couchbase
# Recipe:: server
#
# Copyright 2014, Videology Inc.
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#

::Chef::Recipe.send(:include, Opscode::OpenSSL::Password)

if Chef::Config[:solo]
  missing_attrs = %w{
    password
  }.select do |attr|
    node['vlg-couchbase']['server'][attr].nil?
  end.map { |attr| "node['vlg-couchbase']['server']['#{attr}']" }

  if !missing_attrs.empty?
    Chef::Application.fatal!([
        "You must set #{missing_attrs.join(', ')} in chef-solo mode.",
        "For more information, see https://github.com/juliandunn/couchbase#chef-solo-note"
      ].join(' '))
  end
else
  # generate all passwords
  (node.set['vlg-couchbase']['server']['password'] = secure_password && node.save) unless node['vlg-couchbase']['server']['password']
end

#download couchbase
remote_file File.join(Chef::Config[:file_cache_path], node['vlg-couchbase']['server']['package_file']) do
  source node['vlg-couchbase']['server']['package_full_url']
  action :create_if_missing
end

#create the directory
directories = [
    node['vlg-couchbase']['server']['database_path'],
    node['vlg-couchbase']['server']['log_dir'],
    node['vlg-couchbase']['server']['index_path'],
    node['vlg-couchbase']['server']['install_dir'],
    node['vlg-couchbase']['server']['var_dir'],
    node['vlg-couchbase']['server']['lib_dir']
]

directories.each do |dir_name|
    directory dir_name do
        owner "couchbase"
        group "couchbase"
        mode  '0755'
        action :create
    end
end

#create symlink for init.d logs
link "#{node['vlg-couchbase']['server']['stock_log']}" do
    to "#{node['vlg-couchbase']['server']['log_dir']}"
    only_if "test -d #{node['vlg-couchbase']['server']['log_dir']}"
end

#install couchbase
yum_package File.join(Chef::Config[:file_cache_path], node['vlg-couchbase']['server']['package_file']) do
    options node['vlg-couchbase']['server']['allow_unsigned_packages'] == true ? "--nogpgcheck" : ""
end

ruby_block "block_until_operational" do
  block do
    Chef::Log.info "Waiting until Couchbase is listening on port #{node['vlg-couchbase']['server']['port']}"
    until CouchbaseHelper.service_listening?(node['vlg-couchbase']['server']['port']) do
      sleep 1
      Chef::Log.debug(".")
    end

    Chef::Log.info "Waiting until the Couchbase admin API is responding"
    test_url = URI.parse("http://localhost:#{node['vlg-couchbase']['server']['port']}")
    until CouchbaseHelper.endpoint_responding?(test_url) do
      sleep 1
      Chef::Log.debug(".")
    end
  end
  action :nothing
end

directory node['vlg-couchbase']['server']['log_dir'] do
  owner "couchbase"
  group "couchbase"
  mode 0755
  recursive true
end

ruby_block "rewrite_couchbase_log_dir_config" do
  log_dir_line = %{{error_logger_mf_dir, "#{node['vlg-couchbase']['server']['log_dir']}"}.}
  static_config_file = ::File.join(node['vlg-couchbase']['server']['install_dir'], 'etc', 'vlg-couchbase', 'static_config')

  block do
    file = Chef::Util::FileEdit.new(static_config_file)
    file.search_file_replace_line(/error_logger_mf_dir/, log_dir_line)
    file.write_file
  end

  notifies :restart, "service[couchbase-server]"
  not_if "grep '#{log_dir_line}' #{static_config_file}"
end

directory node['vlg-couchbase']['server']['database_path'] do
  owner "couchbase"
  group "couchbase"
  mode 0755
  recursive true
end

directory node['vlg-couchbase']['server']['index_path'] do
  owner "couchbase"
  group "couchbase"
  mode 0755
  recursive true
end

service "couchbase-server" do
  supports :restart => true, :status => true
  action [:enable, :start]
  notifies :create, "ruby_block[block_until_operational]", :immediately
end

couchbase_node "self" do
  database_path node['vlg-couchbase']['server']['database_path']

  username node['vlg-couchbase']['server']['username']
  password node['vlg-couchbase']['server']['password']
end

couchbase_node "self" do
  index_path node['vlg-couchbase']['server']['index_path']

  username node['vlg-couchbase']['server']['username']
  password node['vlg-couchbase']['server']['password']
end
