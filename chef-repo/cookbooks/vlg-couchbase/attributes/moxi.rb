#
# Cookbook Name:: vlg-couchbase
# Attributes:: moxi
#
# Author:: GIO (<gio@videologygroup.com>)
# Copyright (C) 2014, Videology, Inc.
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

package_machine = node['kernel']['machine'] == "x86_64" ? "x86_64" : "x86"

default['vlg-couchbase']['moxi']['version'] = "3.0.1"

default['vlg-couchbase']['moxi']['package_file'] = "moxi-server_#{node['vlg-couchbase']['moxi']['version']}_#{package_machine}.rpm"

default['vlg-couchbase']['moxi']['package_base_url'] = "http://packages.couchbase.com/releases/#{node['vlg-couchbase']['moxi']['version']}"
default['vlg-couchbase']['moxi']['package_full_url'] = "#{node['vlg-couchbase']['moxi']['package_base_url']}/#{node['vlg-couchbase']['moxi']['package_file']}"

default['vlg-couchbase']['moxi']['cluster_server'] = 'couchbase01'
default['vlg-couchbase']['moxi']['cluster_rest_url'] = "http://#{node['vlg-couchbase']['moxi']['cluster_server']}:8091/pools/default/bucketsStreaming/default"
