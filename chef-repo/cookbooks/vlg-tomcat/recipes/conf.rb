#
# Cookbook Name:: vlg-tomcat
# Recipe:: conf
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

template node['vlg-tomcat']['conf_dir'] + "/server.xml" do
  source "server.xml.erb"
  owner node['vlg-tomcat']['user']
  group node['vlg-tomcat']['group']
  mode "0755"
  action :create
  variables({
    :vlg_tomcat_doc_base => node['vlg-tomcat']['doc_base'],
    :vlg_tomcat_max_threads => node['vlg-tomcat']['max_threads'],
    :vlg_tomcat_min_spare_threads => node['vlg-tomcat']['min_spare_threads'],
    :vlg_tomcat_shutdown_port => node['vlg-tomcat']['shutdown_port'],
    :vlg_tomcat_connection_timeout => node['vlg-tomcat']['connection_timeout'],
    :vlg_tomcat_enable_lookups => node['vlg-tomcat']['enable_lookups'],
    :vlg_tomcat_max_http_header_size => node['vlg-tomcat']['max_http_header_size'],
    :vlg_tomcat_executor => node['vlg-tomcat']['executor'],
    :vlg_tomcat_accept_count => node['vlg-tomcat']['accept_count'],
    :vlg_tomcat_max_keep_alive_requests => node['vlg-tomcat']['max_keep_alive_requests'],
    :vlg_tomcat_keep_alive_timeout => node['vlg-tomcat']['keep_alive_timeout'],
    :vlg_tomcat_port_8080_enable => node['vlg-tomcat']['port_8080']['enable'],
    :vlg_tomcat_port_8080_protocol => node['vlg-tomcat']['port_8080']['protocol'],
    :vlg_tomcat_port_9030_enable => node['vlg-tomcat']['port_9030']['enable'],
    :vlg_tomcat_port_9030_protocol => node['vlg-tomcat']['port_9030']['protocol'],
    :vlg_tomcat_port_8443_enable => node['vlg-tomcat']['port_8443']['enable'],
    :vlg_tomcat_port_8443_protocol => node['vlg-tomcat']['port_8443']['protocol'],
    :vlg_tomcat_port_8443_scheme => node['vlg-tomcat']['port_8443']['scheme'],
    :vlg_tomcat_port_8443_secure => node['vlg-tomcat']['port_8443']['secure'],
    :vlg_tomcat_port_8443_ssl_protocol => node['vlg-tomcat']['port_8443']['ssl_protocol'],
    :vlg_tomcat_port_8443_ssl_enabled => node['vlg-tomcat']['port_8443']['ssl_enabled'],
    :vlg_tomcat_port_8443_ssl_certificate_file => node['vlg-tomcat']['port_8443']['ssl_certificate_file'],
    :vlg_tomcat_port_8443_ssl_certificate_key_file => node['vlg-tomcat']['port_8443']['ssl_certificate_key_file'],
    :vlg_tomcat_port_8443_ssl_ca_certificate_file => node['vlg-tomcat']['port_8443']['ssl_ca_certificate_file'],
    :vlg_tomcat_port_8444_enable => node['vlg-tomcat']['port_8444']['enable'],
    :vlg_tomcat_port_8444_protocol => node['vlg-tomcat']['port_8444']['protocol'],
    :vlg_tomcat_port_8444_scheme => node['vlg-tomcat']['port_8444']['scheme'],
    :vlg_tomcat_port_8444_secure => node['vlg-tomcat']['port_8444']['secure'],
    :vlg_tomcat_port_8444_ssl_protocol => node['vlg-tomcat']['port_8444']['ssl_protocol'],
    :vlg_tomcat_port_8444_ssl_enabled => node['vlg-tomcat']['port_8444']['ssl_enabled'],
    :vlg_tomcat_port_8444_ssl_certificate_file => node['vlg-tomcat']['port_8444']['ssl_certificate_file'],
    :vlg_tomcat_port_8444_ssl_certificate_key_file => node['vlg-tomcat']['port_8444']['ssl_certificate_key_file'],
    :vlg_tomcat_port_8444_ssl_ca_certificate_file => node['vlg-tomcat']['port_8444']['ssl_ca_certificate_file'],
    :vlg_tomcat_port_8445_enable => node['vlg-tomcat']['port_8445']['enable'],
    :vlg_tomcat_port_8445_protocol => node['vlg-tomcat']['port_8445']['protocol'],
    :vlg_tomcat_port_8445_scheme => node['vlg-tomcat']['port_8445']['scheme'],
    :vlg_tomcat_port_8445_secure => node['vlg-tomcat']['port_8445']['secure'],
    :vlg_tomcat_port_8445_ssl_protocol => node['vlg-tomcat']['port_8445']['ssl_protocol'],
    :vlg_tomcat_port_8445_ssl_enabled => node['vlg-tomcat']['port_8445']['ssl_enabled'],
    :vlg_tomcat_port_8445_ssl_certificate_file => node['vlg-tomcat']['port_8445']['ssl_certificate_file'],
    :vlg_tomcat_port_8445_ssl_certificate_key_file => node['vlg-tomcat']['port_8445']['ssl_certificate_key_file'],
    :vlg_tomcat_port_8445_ssl_ca_certificate_file => node['vlg-tomcat']['port_8445']['ssl_ca_certificate_file'],
    :vlg_tomcat_port_8447_enable => node['vlg-tomcat']['port_8447']['enable'],
    :vlg_tomcat_port_8447_protocol => node['vlg-tomcat']['port_8447']['protocol'],
    :vlg_tomcat_port_8447_scheme => node['vlg-tomcat']['port_8447']['scheme'],
    :vlg_tomcat_port_8447_secure => node['vlg-tomcat']['port_8447']['secure'],
    :vlg_tomcat_port_8447_ssl_protocol => node['vlg-tomcat']['port_8447']['ssl_protocol'],
    :vlg_tomcat_port_8447_ssl_enabled => node['vlg-tomcat']['port_8447']['ssl_enabled'],
    :vlg_tomcat_port_8447_ssl_certificate_file => node['vlg-tomcat']['port_8447']['ssl_certificate_file'],
    :vlg_tomcat_port_8447_ssl_certificate_key_file => node['vlg-tomcat']['port_8447']['ssl_certificate_key_file'],
    :vlg_tomcat_port_8447_ssl_ca_certificate_file => node['vlg-tomcat']['port_8447']['ssl_ca_certificate_file']
  })
end

template node['vlg-tomcat']['bin_dir'] + "/setenv.sh" do
  source "setenv.sh.erb"
  owner node['vlg-tomcat']['user']
  group node['vlg-tomcat']['group']
  mode "0755"
  action :create
  variables({
    :vlg_tomcat_java_opts => node['vlg-tomcat']['java_opts'],
    :vlg_tomcat_jvm_heap => node['vlg-tomcat']['jvm_heap'],
    :vlg_tomcat_jvm_max_perm_size => node['vlg-tomcat']['jvm_max_perm_size'],
    :vlg_tomcat_jvm_thread_stack => node['vlg-tomcat']['jvm_thread_stack'],
    :vlg_tomcat_jvm_gc_algorithm => node['vlg-tomcat']['jvm_gc_algorithm'],
    :vlg_tomcat_jvm_gc_log => node['vlg-tomcat']['jvm_gc_log'],
    :vlg_tomcat_lib => node['vlg-tomcat']['lib_dir'],
    :vlg_tomcat_user => node['vlg-tomcat']['user'],
    :vlg_tomcat_timezone => node['vlg-tomcat']['timezone'],
  })
end

template node['vlg-tomcat']['conf_dir'] + "/tomcat-users.xml" do
  source "tomcat-users.xml.erb"
  owner node['vlg-tomcat']['user']
  group node['vlg-tomcat']['group']
  mode "0755"
  action :create
end

template node['vlg-tomcat']['conf_dir'] + "/web.xml" do
  source "web.xml.erb"
  owner node['vlg-tomcat']['user']
  group node['vlg-tomcat']['group']
  mode "0755"
  action :create
end

template node['vlg-tomcat']['conf_dir'] + "/logging.properties" do
  source "logging.properties.erb"
  owner node['vlg-tomcat']['user']
  group node['vlg-tomcat']['group']
  mode "0755"
  action :create
end

template node['vlg-tomcat']['conf_dir'] + "/context.xml" do
  source "context.xml.erb"
  owner node['vlg-tomcat']['user']
  group node['vlg-tomcat']['group']
  mode "0755"
  action :create
end

template node['vlg-tomcat']['conf_dir'] + "/catalina.properties" do
  source "catalina.properties.erb"
  owner node['vlg-tomcat']['user']
  group node['vlg-tomcat']['group']
  mode "0755"
  action :create
end

template node['vlg-tomcat']['conf_dir'] + "/catalina.policy" do
  source "catalina.policy.erb"
  owner node['vlg-tomcat']['user']
  group node['vlg-tomcat']['group']
  mode "0755"
  action :create
end

template node['vlg-tomcat']['conf_dir'] + "/setclasspath.sh" do
  source "setclasspath.sh.erb"
  owner node['vlg-tomcat']['user']
  group node['vlg-tomcat']['group']
  mode "0755"
  action :create
end
