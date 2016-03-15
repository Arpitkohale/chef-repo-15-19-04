#
# Cookbook Name:: mono
# Recipe:: install_packages
# Author:: Guilhem Lettron <guilhem.lettron@youscribe.com>
#
# Copyright 2012, Societe Publica.
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

if platform_family?('suse')
  package "mono-stable"
elsif platform_family?('debian')
  package "mono-complete"
elsif platform_family?('rhel')
  yum_repository 'mono' do
    description "Mono repository"
    baseurl node['mono']['yum_repository']
    gpgkey node['mono']['yum_repository_key']
  end
  package "mono-complete"
end
