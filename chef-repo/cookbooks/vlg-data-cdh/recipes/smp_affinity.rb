#
# Cookbook Name:: vlg-data-cdh
# Recipe:: smp_affinity
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

if node['ec2']['instance_type'] == 'c3.4xlarge' || node['ec2']['instance_type'] == 'cc2.8xlarge'
  bash 'set_smp_affinity' do
    code <<-EOH
      irq=$(grep eth0 /proc/interrupts | cut -d: -f1)
      affinity=$(cat /proc/irq/$irq/smp_affinity | awk -F"," '{print $NF}')
      if [ "$affinity" != "ffffffff" ]
      then
        echo ffffffff > /proc/irq/$irq/smp_affinity
      fi
      EOH
    not_if "cat /proc/irq/`grep eth0 /proc/interrupts | cut -d: -f1`/smp_affinity | awk -F',' '{print $NF}' | grep -q ffffffff"
  end
end
