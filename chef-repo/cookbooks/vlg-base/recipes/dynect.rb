#
# Cookbook Name:: vlg-base
# Recipe:: dynect
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

if node['vlg-base']['dynect'] != 'disable'
  # Only run if the hostname is set properly
  if node["domain"] == node["dynect"]["domain"]
    # Get the record type from the authoritative nameserver and strip new lines
    nameserver = `dig SOA +short #{node['dynect']['domain']} | awk '{print $1}'`
    nameserver = nameserver[/[^\n]+/]
    record_resolution = `dig @#{nameserver} #{node['fqdn']} +short +noall +answer`
    record_type = `dig @#{nameserver} #{node['fqdn']} +noall +answer | tail -1 | awk '{print $4}'`
    record_type = record_type[/[^\n]+/]

    # Only run if the record type is an A record or CNAME or if the record is empty... Otherwise something might be wrong with this recipe so we'll bail out just to be safe
    if record_type == 'A' || record_type == 'CNAME' || record_resolution == ''
      # Install the dynect gem
      include_recipe "dynect::default"

      # ec2_public_hostname
      if node['vlg-base']['dynect'] == 'ec2_public_hostname'
        if node['ec2']['public_hostname'].to_s != ''

          # Check to make sure the record in Dyn is a CNAME... If not then delete the record first
          if record_type != 'CNAME'
            dynect_rr node["hostname"] do
              record_type "#{record_type}"
              fqdn "#{node["hostname"]}.#{node["dynect"]["domain"]}"
              customer node["dynect"]["customer"]
              username node["dynect"]["username"]
              password node["dynect"]["password"]
	          ttl node['vlg-base']['dynect_ttl']
              zone node["dynect"]["zone"]
              action :delete
			  ignore_failure true
            end
          end

          # Add/Update the CNAME
          # <hostname>.inf.videologygroup.com -> ec2.public_hostname
          dynect_rr node["hostname"] do
            record_type "CNAME"
            fqdn "#{node["hostname"]}.#{node["dynect"]["domain"]}"
            rdata({ "cname" => "#{node["ec2"]["public_hostname"]}." })
            customer node["dynect"]["customer"]
            username node["dynect"]["username"]
            password node["dynect"]["password"]
	    	ttl node['vlg-base']['dynect_ttl']
            zone node["dynect"]["zone"]
            action :update
		    ignore_failure true
          end
        end
      end

      # ec2_local_ipv4
      if node['vlg-base']['dynect'] == 'ec2_local_ipv4'
        if node['ec2']['local_ipv4'].to_s != ''

          # Check to make sure the record in Dyn is an A record... If not then delete the record first
          if record_type != 'A'
            dynect_rr node["hostname"] do
              record_type "#{record_type}"
              fqdn "#{node["hostname"]}.#{node["dynect"]["domain"]}"
              customer node["dynect"]["customer"]
              username node["dynect"]["username"]
              password node["dynect"]["password"]
	      	  ttl node['vlg-base']['dynect_ttl']
              zone node["dynect"]["zone"]
              action :delete
			  ignore_failure true
            end
          end

          # Add/Update the A record
          # <hostname>.inf.videologygroup.com -> ec2.local_ipv4
          dynect_rr node["hostname"] do
            record_type "A"
            fqdn "#{node["hostname"]}.#{node["dynect"]["domain"]}"
            rdata({ "address" => "#{node["ec2"]["local_ipv4"]}" })
            customer node["dynect"]["customer"]
            username node["dynect"]["username"]
            password node["dynect"]["password"]
	        ttl node['vlg-base']['dynect_ttl']
            zone node["dynect"]["zone"]
            action :update
			ignore_failure true
          end
        end
      end
    end
  end
end
