#
# Cookbook Name:: vlg-sysctl
# Recipe:: high-tcp-performance
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

# Tuning for higher TCP performance
node.default['sysctl']['params']['vm']['swappiness'] = 20
node.default['sysctl']['params']['net']['core']['wmem_max'] = 12582912
node.default['sysctl']['params']['net']['core']['rmem_max'] = 12582912
node.default['sysctl']['params']['net']['core']['wmem_node.default'] = 4194304
node.default['sysctl']['params']['net']['core']['mmem_node.default'] = 4194304
node.default['sysctl']['params']['net']['ipv4']['tcp_wmem'] = '10240 87380 12582912'
node.default['sysctl']['params']['net']['ipv4']['tcp_rmem'] = '10240 87380 12582912'
node.default['sysctl']['params']['net']['ipv4']['tcp_window_scaling'] = 1
node.default['sysctl']['params']['net']['ipv4']['tcp_timestamps'] = 1
node.default['sysctl']['params']['net']['ipv4']['tcp_sack'] = 1
node.default['sysctl']['params']['net']['ipv4']['tcp_no_metrics_save'] = 1

# Discourage swapping
node.default['sysctl']['params']['vm']['swappiness'] = 25
node.default['sysctl']['params']['vm']['overcommit_ratio'] = 80
node.default['sysctl']['params']['vm']['overcommit_memory'] = 2

# Handle TCP Connection Floods
node.default['sysctl']['params']['net']['ipv4']['tcp_synack_retries'] = 2
node.default['sysctl']['params']['net']['ipv4']['tcp_syncookies'] = 1
node.default['sysctl']['params']['net']['ipv4']['tcp_fin_timeout'] = 30

# Larger backlogs for network devices
node.default['sysctl']['params']['net']['core']['netdev_max_backlog'] = 8192
node.default['sysctl']['params']['net']['core']['somaxconn'] = 2048
node.default['sysctl']['params']['net']['ipv4']['tcp_max_syn_backlog'] = 8192

# Reduce timeouts
node.default['sysctl']['params']['net']['ipv4']['tcp_keepalive_time'] = 30
node.default['sysctl']['params']['net']['ipv4']['tcp_keepalive_intvl'] = 1
node.default['sysctl']['params']['net']['ipv4']['tcp_keepalive_probes'] = 2

# Aggressive dispose of old connections and reuse sockets
node.default['sysctl']['params']['net']['ipv4']['tcp_tw_recycle'] = 1
node.default['sysctl']['params']['net']['ipv4']['tcp_tw_reuse'] = 1
node.default['sysctl']['params']['net']['ipv4']['tcp_max_tw_buckets'] = 1440000

# Increase max_map_count to avoid running out of mapped areas
node.default['sysctl']['params']['vm']['max_map_count'] = 16777216

# Apply the settings
include_recipe "sysctl::apply"
