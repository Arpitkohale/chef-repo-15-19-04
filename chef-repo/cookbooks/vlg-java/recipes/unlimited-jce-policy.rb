#
# Cookbook Name:: vlg-java
# Recipe:: unlimited-jce-policy
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

remote_file "/usr/lib/jvm/java/jre/lib/security/US_export_policy.jar" do
  source "#{node['vlg-java']['unlimited_jce_policy_url']}/US_export_policy.jar"
  checksum "#{node['vlg-java']['unlimited_jce_policy']['US_export_policy_checksum']}"
  only_if "test -d /usr/lib/jvm/java/jre/lib/security"
end

remote_file "/usr/lib/jvm/java/jre/lib/security/local_policy.jar" do
  source "#{node['vlg-java']['unlimited_jce_policy_url']}/local_policy.jar"
  checksum "#{node['vlg-java']['unlimited_jce_policy']['local_policy_checksum']}"
  only_if "test -d /usr/lib/jvm/java/jre/lib/security"
end
