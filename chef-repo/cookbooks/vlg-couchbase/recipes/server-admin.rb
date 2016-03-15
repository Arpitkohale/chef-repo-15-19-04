#
# Cookbook Name:: vlg-couchbase
# Recipe:: server-admin
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

couchbase_settings "web" do
  settings({
    "username" => node['vlg-couchbase']['server']['username'],
    "password" => node['vlg-couchbase']['server']['password'],
    "port" => 8091,
  })

  username node['vlg-couchbase']['server']['username']
  password node['vlg-couchbase']['server']['password']
end

##tdb
#couchbase_settings "readOnlyUser" do
#  settings({
#    "username" => node['vlg-couchbase']['server']['ro_username'],
#    "password" => node['vlg-couchbase']['server']['ro_password'],
#    "port" => 8091,
#  })
#
#  username node['vlg-couchbase']['server']['username']
#  password node['vlg-couchbase']['server']['password']
#end
##
