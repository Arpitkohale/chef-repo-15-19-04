default['infobright']['version'] = "4.0.7"
default['infobright']['role'] = "master"

case node['platform_family']
when 'rhel'
  if kernel['machine'] =~ /x86_64/
    default['infobright']['binaryname'] = "infobright-#{default['infobright']['version']}-0-x86_64-ice.rpm"
  else
    default['infobright']['binaryname'] = "infobright-#{default['infobright']['version']}-0-i686-ice.rpm"
  end
  default['infobright']['url'] = "http://www.infobright.org/downloads/ice/#{default['infobright']['binaryname']}"

else
  default['infobright']['url'] = nil

end

