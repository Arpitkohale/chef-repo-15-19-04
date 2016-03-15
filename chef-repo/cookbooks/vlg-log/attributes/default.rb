# s3 mounts
default['vlg-log']['s3_mount_path'] = node['vlg-ephemeral']['striped']['root'] + '/s3'
default['vlg-log']['s3_tmp_path'] = node['vlg-ephemeral']['striped']['root'] + '/tmp'
#default['vlg-log']['s3_buckets'] = [ 'ttv-logs', 'ttv-iislogs', 'vg-oregon-logs', 'vg-singapore-logs', 'vg-eu-west-1-logs', 'vg-elb-logs-apne', 'vg-elb-logs-apse', 'vg-elb-logs-euir', 'vg-elb-logs-usor', 'vg-elb-logs-usva' ]
