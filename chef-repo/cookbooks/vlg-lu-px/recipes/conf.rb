#
# Cookbook Name:: vlg-lu-px
# Recipe:: conf
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

# find request handlers using chef search
request_handlers = nil
staging_request_handlers = nil
case node.chef_environment
when "production"
  case node['vlg-base']['location']
  when "usva"
    request_handlers = search(:node, "recipes:vlg-lu-rh AND chef_environment:production AND vlg-base_location:usva")
  when "usor"
    request_handlers = search(:node, "recipes:vlg-lu-rh AND chef_environment:production AND vlg-base_location:usor")
  when "usca"
    request_handlers = search(:node, "recipes:vlg-lu-rh AND chef_environment:production AND vlg-base_location:usor")
  when "euir"
    request_handlers = search(:node, "recipes:vlg-lu-rh AND chef_environment:production AND vlg-base_location:euir")
  when "apsg"
    request_handlers = search(:node, "recipes:vlg-lu-rh AND chef_environment:production AND vlg-base_location:apsg")
  end
when "endtoend"
request_handlers = search(:node, "recipes:vlg-lu-rh AND chef_environment:endtoend")
when "staging"
  request_handlers = search(:node, "recipes:vlg-lu-rh AND chef_environment:staging")
when "sandbox"
  request_handlers = search(:node, "recipes:vlg-lu-rh AND chef_environment:sandbox")
end

if request_handlers != nil
  request_handlers.sort!{|x, y| x[:fqdn] <=> y[:fqdn]}
end

staging_request_handlers = search(:node, "recipes:vlg-lu-rh AND chef_environment:staging")
if staging_request_handlers != nil
  staging_request_handlers.sort!{|x, y| x[:fqdn] <=> y[:fqdn]}
end

if request_handlers != nil
  # haproxy.cfg template override
  begin
    t = resources(:template => "#{node['vlg-haproxy']['etc_dir']}/haproxy.cfg")
    t.source "haproxy.cfg.erb"
    t.cookbook "vlg-lu-px"
    t.variables({
	      :request_handlers => request_handlers,
	      :staging_request_handlers => staging_request_handlers,
              :global_stats_socket_file => node['vlg-lu-px']['haproxy']['global']['stats']['socket']['file'],
              :global_stats_socket_timeout => node['vlg-lu-px']['haproxy']['global']['stats']['socket']['timeout'],
              :global_maxconn => node['vlg-lu-px']['haproxy']['global']['maxconn'],
              :global_nbproc => node['vlg-lu-px']['haproxy']['global']['nbproc'],
              :global_user => node['vlg-lu-px']['haproxy']['global']['user'],
              :global_group => node['vlg-lu-px']['haproxy']['global']['group'],
              :global_tune_ssl_default_dh_param => node['vlg-lu-px']['haproxy']['global']['tune']['ssl']['default-dh-param'],
              :global_ssl_default_bind_ciphers => node['vlg-lu-px']['haproxy']['global']['ssl']['default-bind-ciphers'],
              :global_ssl_default_bind_options => node['vlg-lu-px']['haproxy']['global']['ssl']['default-bind-options'],
              :defaults_mode => node['vlg-lu-px']['haproxy']['defaults']['mode'],
              :defaults_retries => node['vlg-lu-px']['haproxy']['defaults']['retries'],
              :defaults_timeout_client => node['vlg-lu-px']['haproxy']['defaults']['timeout']['client'],
              :defaults_timeout_connect => node['vlg-lu-px']['haproxy']['defaults']['timeout']['connect'],
              :defaults_timeout_server => node['vlg-lu-px']['haproxy']['defaults']['timeout']['server'],
              :defaults_timeout_http_keep_alive => node['vlg-lu-px']['haproxy']['defaults']['timeout']['http-keep-alive'],
              :defaults_timeout_http_request => node['vlg-lu-px']['haproxy']['defaults']['timeout']['http-request'],
              :defaults_timeout_queue => node['vlg-lu-px']['haproxy']['defaults']['timeout']['queue'],
              :defaults_default_server => node['vlg-lu-px']['haproxy']['defaults']['default-server'],
              :listen_8161_toggle => node['vlg-lu-px']['haproxy']['listen']['8161']['toggle'],
              :listen_8161_maxconn => node['vlg-lu-px']['haproxy']['listen']['8161']['maxconn'],
              :listen_8161_mode => node['vlg-lu-px']['haproxy']['listen']['8161']['mode'],
              :listen_8161_send_traffic_to_staging => node['vlg-lu-px']['haproxy']['listen']['8161']['send-traffic-to-staging'],
              :listen_8162_stats_uri => node['vlg-lu-px']['haproxy']['listen']['8162']['stats']['uri'],
              :listen_8162_stats_uri => node['vlg-lu-px']['haproxy']['listen']['8162']['stats']['uri'],
              :listen_80_toggle => node['vlg-lu-px']['haproxy']['listen']['80']['toggle'],
              :listen_80_maxconn => node['vlg-lu-px']['haproxy']['listen']['80']['maxconn'],
              :listen_80_mode => node['vlg-lu-px']['haproxy']['listen']['80']['mode'],
              :listen_80_send_traffic_to_staging => node['vlg-lu-px']['haproxy']['listen']['80']['send-traffic-to-staging'],
              :listen_443_toggle => node['vlg-lu-px']['haproxy']['listen']['443']['toggle'],
              :listen_443_maxconn => node['vlg-lu-px']['haproxy']['listen']['443']['maxconn'],
              :listen_443_mode => node['vlg-lu-px']['haproxy']['listen']['443']['mode'],
              :listen_443_send_traffic_to_staging => node['vlg-lu-px']['haproxy']['listen']['443']['send-traffic-to-staging'],
              :listen_443_pem => node['vlg-lu-px']['haproxy']['listen']['443']['pem'],
              :listen_8080_toggle => node['vlg-lu-px']['haproxy']['listen']['8080']['toggle'],
              :listen_8080_maxconn => node['vlg-lu-px']['haproxy']['listen']['8080']['maxconn'],
              :listen_8080_mode => node['vlg-lu-px']['haproxy']['listen']['8080']['mode'],
              :listen_8080_send_traffic_to_staging => node['vlg-lu-px']['haproxy']['listen']['8080']['send-traffic-to-staging'],
              :listen_9030_toggle => node['vlg-lu-px']['haproxy']['listen']['9030']['toggle'],
              :listen_9030_maxconn => node['vlg-lu-px']['haproxy']['listen']['9030']['maxconn'],
              :listen_9030_mode => node['vlg-lu-px']['haproxy']['listen']['9030']['mode'],
              :listen_9030_send_traffic_to_staging => node['vlg-lu-px']['haproxy']['listen']['9030']['send-traffic-to-staging'],
              :backend_weight => node['vlg-lu-px']['haproxy']['backend']['weight'],
              :staging_backend_weight => node['vlg-lu-px']['haproxy']['staging']['backend']['weight'],
              environment: node.chef_environment
    })
  rescue Chef::Exceptions::ResourceNotFound
    Chef::Log.warn "Could not find template #{node['vlg-haproxy']['etc_dir']}/haproxy.cfg to modify"
  end
end
