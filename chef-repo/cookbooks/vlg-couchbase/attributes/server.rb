#
# Cookbook Name:: vlgcouchbase
# Attributes:: server
#
# Author:: GIO (<gio@videologygroup.com>)
# Copyright (C) 2014, Videology Inc.
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

default['vlg-couchbase']['server']['edition'] = "community"
default['vlg-couchbase']['server']['version'] = "3.0.1"

default['vlg-couchbase']['server']['package_file'] = "couchbase-server-#{node['vlg-couchbase']['server']['edition']}-#{node['vlg-couchbase']['server']['version']}-centos6.x86_64.rpm"

default['vlg-couchbase']['server']['package_base_url'] = "http://packages.couchbase.com/releases/#{node['vlg-couchbase']['server']['version']}"
default['vlg-couchbase']['server']['package_full_url'] = "#{node['vlg-couchbase']['server']['package_base_url']}/#{node['vlg-couchbase']['server']['package_file']}"

default['vlg-couchbase']['server']['install_dir'] = "/opt/couchbase"
default['vlg-couchbase']['server']['var_dir'] = "/opt/couchbase/var"
default['vlg-couchbase']['server']['lib_dir'] = "/opt/couchbase/var/lib"
default['vlg-couchbase']['server']['data_dir'] = "/data"

default['vlg-couchbase']['server']['database_path'] = File.join(node['vlg-couchbase']['server']['data_dir'],"db")
default['vlg-couchbase']['server']['index_path'] = File.join(node['vlg-couchbase']['server']['data_dir'],"index")
default['vlg-couchbase']['server']['stock_log'] = File.join(node['vlg-couchbase']['server']['lib_dir'],"logs")
default['vlg-couchbase']['server']['log_dir'] = File.join(node['vlg-couchbase']['server']['data_dir'],"logs")

default['vlg-couchbase']['server']['username'] = "Administrator"
default['vlg-couchbase']['server']['password'] = nil

default['vlg-couchbase']['server']['ro_username'] = "elizacbro"
default['vlg-couchbase']['server']['ro_password'] = "v1d30l0gy"

default['vlg-couchbase']['server']['memory_quota_mb'] = Couchbase::MaxMemoryQuotaCalculator.from_node(node).in_megabytes

default['vlg-couchbase']['server']['port'] = 8091

default['vlg-couchbase']['server']['allow_unsigned_packages'] = true
