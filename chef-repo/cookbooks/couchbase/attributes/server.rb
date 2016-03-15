#
# Cookbook Name:: couchbase
# Attributes:: server
#
# Author:: Julian C. Dunn (<jdunn@opscode.com>)
# Copyright (C) 2012, SecondMarket Labs, LLC.
# Copyright (C) 2013, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default['couchbase']['server']['edition'] = "community"
default['couchbase']['server']['version'] = "3.0.1"

default['couchbase']['server']['package_file'] = "couchbase-server-#{node['couchbase']['server']['edition']}-#{node['couchbase']['server']['version']}-centos6.x86_64.rpm"

default['couchbase']['server']['package_base_url'] = "http://packages.couchbase.com/releases/#{node['couchbase']['server']['version']}"
default['couchbase']['server']['package_full_url'] = "#{node['couchbase']['server']['package_base_url']}/#{node['couchbase']['server']['package_file']}"

default['couchbase']['server']['install_dir'] = "/opt/couchbase"
default['couchbase']['server']['var_dir'] = "/opt/couchbase/var"
default['couchbase']['server']['lib_dir'] = "/opt/couchbase/var/lib"
default['couchbase']['server']['data_dir'] = "/data"

default['couchbase']['server']['database_path'] = File.join(node['couchbase']['server']['data_dir'],"db")
default['couchbase']['server']['index_path'] = File.join(node['couchbase']['server']['data_dir'],"index")
default['couchbase']['server']['stock_log'] = File.join(node['couchbase']['server']['lib_dir'],"logs")
default['couchbase']['server']['log_dir'] = File.join(node['couchbase']['server']['data_dir'],"logs")

default['couchbase']['server']['username'] = "Administrator"
default['couchbase']['server']['password'] = nil

default['couchbase']['server']['ro_username'] = "elizacbro"
default['couchbase']['server']['ro_password'] = "v1d30l0gy"

default['couchbase']['server']['memory_quota_mb'] = Couchbase::MaxMemoryQuotaCalculator.from_node(node).in_megabytes

default['couchbase']['server']['port'] = 8091

default['couchbase']['server']['allow_unsigned_packages'] = true
